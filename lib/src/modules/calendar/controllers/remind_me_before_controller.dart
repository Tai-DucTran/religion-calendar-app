import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remind_me_before_controller.g.dart';

@riverpod
class RemindMeBeforeController extends _$RemindMeBeforeController {
  @override
  RemindMeBeforeOptions build() {
    return RemindMeBeforeOptions.atTime;
  }

  RemindMeBeforeOptions get option => state;

  void setOption(RemindMeBeforeOptions option) {
    state = option;
  }
}