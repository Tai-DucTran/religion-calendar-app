import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_category_controller.g.dart';

@riverpod
class CalendarCategoryController extends _$CalendarCategoryController {
  @override
  CalendarCategory build() {
    return CalendarCategory.solar;
  }

  CalendarCategory get category => state;

  void setCategory(CalendarCategory category) {
    state = category;
  }
}
