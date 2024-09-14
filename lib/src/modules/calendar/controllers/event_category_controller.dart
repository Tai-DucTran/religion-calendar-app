import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_category_controller.g.dart';

@riverpod
class EventCategoryController extends _$EventCategoryController {
  @override
  EventCategory build() {
    return EventCategory.personalEvent;
  }

  EventCategory get category => state;

  void setCategory(EventCategory category) {
    state = category;
  }
}
