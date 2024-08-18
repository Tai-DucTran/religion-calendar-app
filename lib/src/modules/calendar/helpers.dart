import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';

DateTime getCurrentSolarDate({int? timeZone}) =>
    FullCalender.now(timeZone ?? TimeZone.indonesiaUTC8.timezone).date;

List<DateTime> getCurrentWeekDates() {
  final DateTime now = getCurrentSolarDate();
  final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));

  return List<DateTime>.generate(
    7,
    (index) => startOfWeek.add(
      Duration(days: index),
    ),
  );
}

bool isDateToday(DateTime date) {
  final DateTime now = getCurrentSolarDate();

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
  final DateTime now = getCurrentSolarDate();

  return date.month == now.month;
}

String getCurrentSolarDateText({int? timeZone}) {
  final DateTime now =
      FullCalender.now(timeZone ?? TimeZone.indonesiaUTC8.timezone).date;
  final DateFormat formatter = DateFormat('dd MMMM, yyyy');

  return formatter.format(now);
}

String getCurrentLunarDateText({int? timeZone}) {
  final LunarDateTime now =
      FullCalender.now(timeZone ?? TimeZone.indonesiaUTC8.timezone).lunarDate;
  final DateFormat formatter = DateFormat('dd MMMM, yyyy');
  final date = DateTime(now.year, now.month, now.day);

  return formatter.format(date);
}
