// Provider to manage the selected date
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

// Provider to manage the displayed month
final displayedMonthProvider = StateProvider<DateTime>((ref) => DateTime.now());

final calendarLayoutProvider =
    Provider.family<double, DateTime>((ref, currentMonth) {
  final hasSixWeeks = isHasSixWeeksInMonth(currentMonth);
  return hasSixWeeks ? 0.39 : 0.46;
});
