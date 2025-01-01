import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/user_event_repository.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_user_event_controller.g.dart';

@riverpod
class UpcomingUserEventsController extends _$UpcomingUserEventsController {
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;

  @override
  Future<List<UserEvent>> build() async {
    return _fetchNextBatch();
  }

  Future<List<UserEvent>> _fetchNextBatch() async {
    if (!_hasMore) return state.value ?? [];

    final repo = ref.read(userEventRepositoryProvider);
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.currentUser?.uid;

    if (userId == null) return [];

    try {
      final results = await repo.fetchUpcomingUserEvents(
        userId: userId,
        lastDocument: _lastDocument,
      );

      if (results.isEmpty || results.length < limitedPagination) {
        _hasMore = false;
      }

      if (results.isNotEmpty) {
        _lastDocument = results.last.snapshot;
      }

      final currentEvents = state.value ?? [];
      return [...currentEvents, ...results.map((r) => r.event)];
    } on UserEventException catch (error, stackTrace) {
      Log.error(error.message, error: error, stackTrace: stackTrace);
      return state.value ?? [];
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore) return;
    state = const AsyncLoading();
    state = AsyncData(await _fetchNextBatch());
  }

  Future<void> onEventCreated(UserEvent newEvent) async {
    if (newEvent.startDate.isAfter(DateTime.now())) {
      _lastDocument = null;
      _hasMore = true;
      state = const AsyncLoading();
      state = AsyncData(await _fetchNextBatch());
    }
  }

  bool get hasMore => _hasMore;
}
