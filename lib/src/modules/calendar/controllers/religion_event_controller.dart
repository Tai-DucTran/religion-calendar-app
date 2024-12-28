import 'dart:async';

import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_controller.g.dart';

@riverpod
class ReligionEventController extends _$ReligionEventController {
  StreamSubscription<List<ReligionEvent>>? _subscription;

  @override
  FutureOr<List<ReligionEvent>> build() async {
    ref.cache();
    final religionEventRepo = ref.read(religionEventRepositoryProvider);
    final userInfor = ref.watch(userControllerProvider);
    final userReligionPreference = userInfor.value?.user?.religionPreference;

    if (userReligionPreference == null) {
      return [];
    }

    _subscription?.cancel();

    _subscription =
        religionEventRepo.streamReligionEvents(userReligionPreference).listen(
      (events) {
        state = AsyncData(events);
      },
      onError: (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return await religionEventRepo.fetchReligionEvents(userReligionPreference);
  }
}
