import 'dart:async';

import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_controller.g.dart';

@riverpod
class ReligionEventController extends _$ReligionEventController {
  StreamSubscription<List<ReligionEvent>>? _subscription;

  @override
  FutureOr<List<ReligionEvent>> build() async {
    final repo = ref.read(religionEventRepositoryProvider);
    final userInfor = ref.watch(userControllerProvider);
    final userReligionPreference = userInfor.value?.user?.religionPreference;
    final targetMonth = ref.watch(displayedMonthProvider);

    if (userReligionPreference == null) {
      return [];
    }

    _subscription?.cancel();

    return repo
        .streamReligionEvents(userReligionPreference, targetMonth)
        .first
        .then((initialEvents) {
      _subscription =
          repo.streamReligionEvents(userReligionPreference, targetMonth).listen(
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

      return initialEvents;
    });
  }
}
