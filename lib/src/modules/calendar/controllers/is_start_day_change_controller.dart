import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_start_day_change_controller.g.dart';

@riverpod
class IsStartDayChangeController extends _$IsStartDayChangeController {
  @override
  bool build() {
    return false;
  }

  void changed() => state = true;
  void unChanged() => state = false;
}
