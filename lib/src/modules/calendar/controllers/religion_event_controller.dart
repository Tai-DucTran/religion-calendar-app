import 'package:religion_calendar_app/src/modules/authentication/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_controller.g.dart';

@riverpod
class ReligionEventController extends _$ReligionEventController {
  @override
  FutureOr<List<ReligionEvent>> build() async {
    final religionEventRepo = ref.read(religionEventRepositoryProvider);
    final userRepo = ref.read(userFirestoreRepositoryProvider);
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.currentUser?.uid;

    if (userId != null) {
      final user = await userRepo.getUserDetailedInfor(userId);

      final userReligionPreference = user?.religionPreference;
      if (userReligionPreference == null) {
        return [];
      }
      return await religionEventRepo
          .fetchReligionEvents(userReligionPreference);
    } else {
      return [];
    }
  }
}
