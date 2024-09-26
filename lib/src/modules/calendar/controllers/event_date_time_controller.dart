import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_date_time_controller.g.dart';

@riverpod
class EventDateTimeController extends _$EventDateTimeController {
  final todayDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final DateTime startedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    08,
    08,
  );

  final DateTime endedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    23,
    00,
  );

  @override
  EventDateTime build() {
    return EventDateTime(
      startDate: todayDate,
      startTime: startedTime,
      endDate: todayDate,
      endTime: endedTime,
    );
  }

  void setStartDate(DateTime date) {
    state = state.copyWith(startDate: date);
  }

  void setStartTime(DateTime time) {
    state = state.copyWith(startTime: time);
  }

  void setEndDate(DateTime date) {
    state = state.copyWith(endDate: date);
  }

  void setEndTime(DateTime time) {
    state = state.copyWith(endTime: time);
  }

  void setFullDateTimeRange(DateTime start, DateTime end) {
    state = EventDateTime(
      startDate: start,
      startTime: start.copyWith(
        hour: 08,
        minute: 08,
      ),
      endDate: end,
      endTime: end.copyWith(
        hour: 23,
        minute: 00,
      ),
    );
  }
}
