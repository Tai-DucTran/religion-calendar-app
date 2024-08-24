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

String getWeekdayName({
  required DateTime inputDate,
  bool isGetFullWeekdayName = false,
  String? locale,
}) {
  return DateFormat(
    isGetFullWeekdayName ? 'EEEE' : 'E',
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
    timeZone: timeZone ?? TimeZone.indonesiaUTC8.timezone,
  ).lunarDate.day.toString();
}

String getFullSolarDateText({
  int? timeZone,
  bool isIncludingWeekdayName = false,
  DateTime? inputDate,
  String? locale,
}) {
  final date = inputDate ?? getCurrentSolarDate(timeZone: timeZone);
  final formatter = DateFormat(
    isIncludingWeekdayName ? 'EEEE, dd MMMM, yyyy' : 'dd MMMM, yyyy',
    locale,
  );

  return formatter.format(date);
}

String getFullLunarDateText({
  int? timeZone,
  bool isIncludingWeekdayName = false,
  DateTime? inputDate,
  String? locale,
}) {
  final LunarDateTime lunarDate = inputDate != null
      ? FullCalender(
          date: inputDate,
          timeZone: timeZone ?? TimeZone.indonesiaUTC8.timezone,
        ).lunarDate
      : FullCalender.now(timeZone ?? TimeZone.indonesiaUTC8.timezone).lunarDate;

  final formatter = DateFormat(
    isIncludingWeekdayName ? 'dd MMMM, yyyy' : 'dd MMM, yyyy',
    locale,
  );

  final solarDate = inputDate ?? DateTime.now();
  final weekDayName =
      getWeekdayName(inputDate: solarDate, isGetFullWeekdayName: true);

  final basedLunarDateText = formatter.format(
    DateTime(lunarDate.year, lunarDate.month, lunarDate.day),
  );

  return isIncludingWeekdayName
      ? '$weekDayName, $basedLunarDateText'
      : basedLunarDateText;
}
