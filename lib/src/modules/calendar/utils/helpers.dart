import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';

DateTime getCurrentSolarDate({int? timeZone}) =>
    FullCalender.now(timeZone ?? TimeZone.vietnamese.timezone).date;

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

String getCurrentSolarMonthText({String? locale}) {
  final DateTime now = DateTime.now();
  return DateFormat(DateTimeFormat.month, locale).format(now);
}

String getWeekdayName({
  required DateTime inputDate,
  bool isGetFullWeekdayName = false,
  String? locale,
}) {
  return DateFormat(
    isGetFullWeekdayName ? DateTimeFormat.week : DateTimeFormat.weekNumber,
    locale,
  ).format(inputDate);
}

bool isDateToday(DateTime date) {
  final DateTime now = getCurrentSolarDate();

  return date.day == now.day &&
      date.month == now.month &&
      date.year == now.year;
}

bool isDateInCurrentMonth(DateTime date) {
  final DateTime now = getCurrentSolarDate();

  return date.month == now.month;
}

String getLunarDateNumberText({required DateTime inputDate, int? timeZone}) {
  return FullCalender(
    date: inputDate,
    timeZone: timeZone ?? TimeZone.vietnamese.timezone,
  ).lunarDate.day.toString();
}

String getFullSolarDateText({
  int? timeZone,
  String? dateFormat,
  DateTime? inputDate,
  String? locale,
}) {
  final date = inputDate ?? getCurrentSolarDate(timeZone: timeZone);
  final formatter = DateFormat(
    dateFormat ?? DateTimeFormat.dateMonthYear,
    locale,
  );

  return formatter.format(date);
}

String getFullLunarDateText({
  int? timeZone,
  DateTime? inputDate,
  String? locale,
  String? dateFormat,
}) {
  final LunarDateTime lunarDate = inputDate != null
      ? FullCalender(
          date: inputDate,
          timeZone: timeZone ?? TimeZone.vietnamese.timezone,
        ).lunarDate
      : FullCalender.now(timeZone ?? TimeZone.vietnamese.timezone).lunarDate;

  final formatter = DateFormat(
    dateFormat ?? DateTimeFormat.dateMonthYear,
    locale,
  );

  return formatter.format(
    DateTime(lunarDate.year, lunarDate.month, lunarDate.day),
  );
}
