import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/full_calender_extension.dart';
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

DateTime convertToLunarDate({
  required DateTime inputDate,
  int? timeZone,
}) {
  final LunarDateTime lunarDate = FullCalender(
    date: inputDate,
    timeZone: timeZone ?? TimeZone.vietnamese.timezone,
  ).lunarDate;
  return DateTime(lunarDate.year, lunarDate.month, lunarDate.day);
}

DateTime convertToSolarDate({
  required DateTime inputDate,
  int? timeZone,
}) {
  final lunarDate = LunarDateTime(
      year: inputDate.year, month: inputDate.month, day: inputDate.day);

  // Convert to Solar Date
  DateTime? solarDate =
      FullCalenderExtension.convertLunarDateToSolarDate(lunarDate);
  return DateTime(solarDate!.year, solarDate.month, solarDate.day);
}

class Month {
  String month;
  List<int> days;

  Month({required this.month, required this.days});
}

List<Month> getAllDaysOfALunarYear({required int year}) {
  List<Month> months = [];
  int month = 1;
  DateTime lastDate, nextDate, nextThreeDate;
  bool leapYear = false;
  DateTime lunarDate;
  DateTime solarDate = convertToSolarDate(inputDate: DateTime(year, 1, 1));

  do {
    List<int> daysInMonth = [];
    solarDate = solarDate.add(const Duration(days: 28));
    List.generate(29, (index) => daysInMonth.add(index + 1));

    lastDate = DateTime(year, month, 29);
    //print('LastDate: $lastDate');
    nextDate = convertToNextLunarDate(inputDate: lastDate, days: 1);
    //print('NextDate: $nextDate');

    if (nextDate.compareTo(DateTime(year, month, 30)) == 0) {
      daysInMonth.add(30);
      solarDate = solarDate.add(const Duration(days: 1));
      lastDate = nextDate;
      //print('Compared lastDate: $nextDate');
    }

    nextThreeDate = convertToNextLunarDate(inputDate: lastDate, days: 3);

    months
        .add(Month(month: leapYear ? "$month+" : month.toString(), days: daysInMonth));
    print('Month: $month, days: $daysInMonth');

    print('LastDate: $lastDate, nextDate: $nextDate, nextThreeDate: $nextThreeDate');

    if (nextThreeDate.month == lastDate.month) {
      leapYear = true;
    } else {
      month++;
    }

    solarDate = solarDate.add(const Duration(days: 1));
    lunarDate = convertToLunarDate(inputDate: solarDate);

    //----------

    // lastDate = DateTime(year, month, 29);
    // nextDate = convertToNextLunarDate(inputDate: lastDate, days: 1);

    // final day30 = DateTime(year, month, 30);

    // if (nextDate.compareTo(day30) == 0) {
    //   nextThreeDate =
    //       convertToNextLunarDate(inputDate: DateTime(year, month, 30), days: 3);
    //   days.add(30);
    // }

    // months
    //     .add(Month(month: leapYear ? "$month+" : month.toString(), days: days));
    // print('Month: $month, days: $days');

    // if (nextThreeDate.month > month) {
    //   months.add(
    //       Month(month: leapYear ? "$month+" : month.toString(), days: days));
    //   month = nextDate.month;
    // } else if (nextThreeDate.month == month) {
    //   months.add(
    //       Month(month: leapYear ? "$month+" : month.toString(), days: days));
    // } else {
    //   break;
    // }
  } while (lunarDate.year == year);

  return months;
}

DateTime convertToNextLunarDate(
    {required DateTime inputDate, required int days}) {
  DateTime convertedLastDay, theNextDay, convertedNextDay;

  convertedLastDay = convertToSolarDate(inputDate: inputDate);
  theNextDay = convertedLastDay.add(Duration(days: days));
  convertedNextDay = convertToLunarDate(inputDate: theNextDay);
  print('convertedLastDay: $convertedLastDay, theNextDay: $theNextDay, convertedNextDay: $convertedNextDay');
  return convertedNextDay;
}

List<DateTime> getListDaysOfAMonthLunarYear(
    {required int month, required int year}) {
  List<DateTime> days = [];

  for (int day = 1; day < 30; day++) {
    DateTime date = DateTime(year, month, day);
    //print('Day: $day; date: $date');
    days.add(date);
  }

  DateTime convertedLastDay, theNextDay, convertedNextDay;

  convertedLastDay = convertToSolarDate(inputDate: DateTime(year, month, 29));
  theNextDay = convertedLastDay.add(const Duration(days: 1));
  convertedNextDay = convertToLunarDate(inputDate: theNextDay);

  final day30 = DateTime(year, month, 30);

  if (convertedNextDay.compareTo(day30) == 0) {
    days.add(DateTime(year, month, 30));
  }

  //print('Helpers: $days');
  return days;
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
