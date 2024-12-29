import 'dart:async';

import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/user_event_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_controller.g.dart';

@riverpod
class UserEventController extends _$UserEventController {
  StreamSubscription<List<UserEvent>>? _subscription;

  @override
  FutureOr<List<UserEvent>> build() async {
    final targetMonth = ref.watch(displayedMonthProvider);
    return await getStreamUserEventsByMonth(targetMonth);
  }

  Future<List<UserEvent>> getStreamUserEventsByMonth(DateTime month) {
    final repo = ref.watch(userEventRepositoryProvider);
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.currentUser?.uid;

    if (userId == null) {
      return Future.value(<UserEvent>[]);
    }

    _subscription?.cancel();

    return repo
        .streamUserEventsByMonth(userId, month)
        .first
        .then((initialEvents) {
      _subscription = repo.streamUserEventsByMonth(userId, month).listen(
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
