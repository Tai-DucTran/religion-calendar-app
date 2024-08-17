import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';

List<DateTime> getCurrentWeekDates() {
  final DateTime now = DateTime.now();
  final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));

  return List<DateTime>.generate(
    7,
    (index) => startOfWeek.add(
      Duration(days: index),
    ),
  );
}

bool isDateToday(DateTime date) {
  final DateTime now = DateTime.now();
  return date.day == now.day &&
      date.month == now.month &&
      date.year == now.year;
}

String getLunarDate({required DateTime date, int? timeZone}) {
  return FullCalender(
    date: date,
    timeZone: timeZone ?? TimeZone.indonesiaUTC8.timezone,
  ).lunarDate.day.toString();
}

bool isDateInCurrentMonth(DateTime date) {
  final DateTime now = DateTime.now();
  return date.month == now.month;
}
