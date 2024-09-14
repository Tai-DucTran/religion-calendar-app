import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_all_day_toggle_controller.g.dart';

@riverpod
class IsAllDayToggleController extends _$IsAllDayToggleController {
  @override
  bool build() {
    return false;
  }

  void toggle(bool value) {
    state = value;
  }
}
