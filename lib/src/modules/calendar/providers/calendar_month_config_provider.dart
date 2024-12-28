import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

final calendarMonthConfigProvider = StateProvider<CalendarMonthConfig>((ref) {
  ref.cache();
  final selectedMonth = ref.watch(displayedMonthProvider);
  final daysInMonth =
      DateTime(selectedMonth.year, selectedMonth.month + 1, 0).day;
  final firstWeekday =
      DateTime(selectedMonth.year, selectedMonth.month, 1).weekday;
  final hasSixWeeks = isHasSixWeeksInMonth(selectedMonth);

  return CalendarMonthConfig(
    daysInMonth: daysInMonth,
    firstWeekday: firstWeekday,
    hasSixWeeks: hasSixWeeks,
    year: selectedMonth.year,
    month: selectedMonth.month,
  );
});
