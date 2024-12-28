import 'dart:async';

import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/user_event_repository.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_controller.g.dart';

@riverpod
class UserEventController extends _$UserEventController {
  StreamSubscription<List<UserEvent>>? _subscription;

  @override
  FutureOr<List<UserEvent>> build() async {
    ref.cache();
    final repo = ref.watch(userEventRepositoryProvider);
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.currentUser?.uid;

    if (userId == null) {
      return [];
    }

    _subscription?.cancel();

    _subscription = repo.streamUserEvents(userId).listen(
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

    return await repo.fetchUserEvents(userId);
  }
}
