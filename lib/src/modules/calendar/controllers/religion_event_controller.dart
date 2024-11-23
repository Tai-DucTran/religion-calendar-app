import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_controller.g.dart';

@riverpod
class ReligionEventController extends _$ReligionEventController {
  @override
  FutureOr<List<ReligionEvent>> build() async {
    final religionEventRepo = ref.read(religionEventRepositoryProvider);
    final userInfor = ref.watch(userControllerProvider);
    final userReligionPreference = userInfor.value?.user?.religionPreference;

    if (userReligionPreference == null) {
      return [];
    }
    return await religionEventRepo.fetchReligionEvents(userReligionPreference);
  }
}
