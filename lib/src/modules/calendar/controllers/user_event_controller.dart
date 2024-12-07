import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/user_event_repository.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_controller.g.dart';

@riverpod
class UserEventController extends _$UserEventController {
  @override
  FutureOr<List<UserEvent>> build() async {
    ref.cache();
    final repo = ref.watch(userEventRepositoryProvider);
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.currentUser?.uid;

    if (userId != null) {
      return await repo.fetchUserEvents(userId);
    } else {
      return [];
    }
  }
}
