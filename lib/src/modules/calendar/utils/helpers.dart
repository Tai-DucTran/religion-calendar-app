import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

DateTime getCurrentSolarDate({int? timeZone}) =>
    FullCalender.now(timeZone ?? TimeZone.vietnamese.timezone).date;

List<DateTime> getCurrentWeekDates() {
  final DateTime now = DateTime.now();
  final todayExcludingTime = DateTime(now.year, now.month, now.day);

  final DateTime startOfWeek =
      todayExcludingTime.subtract(Duration(days: now.weekday - 1));

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

bool isFromLastMonth(DateTime date) {
  final DateTime now = getCurrentSolarDate();

  return date.month == now.month - 1;
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
  final lunarDate = convertSolarDateToLunarDate(inputDate: inputDate);
  return DateTime(lunarDate.year, lunarDate.month, lunarDate.day);
}

LunarDateTime convertSolarDateToLunarDate(
    {DateTime? inputDate, int? timeZone}) {
  final LunarDateTime lunarDate = inputDate != null
      ? FullCalender(
          date: inputDate,
          timeZone: timeZone ?? TimeZone.vietnamese.timezone,
        ).lunarDate
      : FullCalender.now(timeZone ?? TimeZone.vietnamese.timezone).lunarDate;

  return lunarDate;
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

  String lunarDateText = LunarDateFormatter.format(
    lunarDate,
    dateFormat ?? DateTimeFormat.dateMonthYear,
    locale,
  );

  if (lunarDate.isLeap) {
    final tempDate = DateTime(lunarDate.year, lunarDate.month, 1);
    final febDate = DateTime(lunarDate.year, lunarDate.month, lunarDate.day);

    // Replace month representations
    final monthNumericFormatter = DateFormat('M', locale);
    final monthNameFormatter = DateFormat('MMMM', locale);
    final monthShortFormatter = DateFormat('MMM', locale);

    lunarDateText = lunarDateText
        .replaceAll(monthNumericFormatter.format(tempDate),
            '${monthNumericFormatter.format(febDate)}+')
        .replaceAll(monthNameFormatter.format(tempDate),
            '${monthNameFormatter.format(febDate)}+')
        .replaceAll(monthShortFormatter.format(tempDate),
            '${monthShortFormatter.format(febDate)}+');
  }

  return lunarDateText;
}

class LunarDateFormatter {
  static String format(LunarDateTime lunarDate, String pattern,
      [String? locale]) {
    // For February dates > 28, use January as proxy month
    if (lunarDate.month == 2 && lunarDate.day > 28) {
      // Use January as proxy month
      final proxyDate = DateTime(lunarDate.year, 1, lunarDate.day);
      final formatter = DateFormat(pattern, locale);
      String formatted = formatter.format(proxyDate);

      // Get February's localized representations
      final febDate = DateTime(lunarDate.year, 2, 1);

      // Replace month representations
      final monthNumericFormatter = DateFormat('M', locale);
      final monthNameFormatter = DateFormat('MMMM', locale);
      final monthShortFormatter = DateFormat('MMM', locale);

      formatted = formatted
          .replaceAll(monthNumericFormatter.format(proxyDate),
              monthNumericFormatter.format(febDate))
          .replaceAll(monthNameFormatter.format(proxyDate),
              monthNameFormatter.format(febDate))
          .replaceAll(monthShortFormatter.format(proxyDate),
              monthShortFormatter.format(febDate));

      return formatted;
    }

    // For all other months
    return DateFormat(pattern, locale)
        .format(DateTime(lunarDate.year, lunarDate.month, lunarDate.day));
  }
}

List<String> getWeekDayNames({
  String? locale,
  bool isShortName = false,
  bool isStartWithMonday = true,
}) {
  final dateFormat = DateFormat(isShortName ? 'EE' : 'EEEE', locale);
  final weekdays = isShortName
      ? dateFormat.dateSymbols.SHORTWEEKDAYS
      : dateFormat.dateSymbols.WEEKDAYS;

  if (isStartWithMonday) {
    return [...weekdays.sublist(1), weekdays.first];
  }
  return weekdays;
}

Map<int, int> getNumberOfDaysInSolarMonths(int year) {
  final Map<int, int> listAllLunarDaysOfYear = {};

  for (int month = 1; month <= 12; month++) {
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;
    listAllLunarDaysOfYear[month] = lastDayOfMonth;
  }

  return listAllLunarDaysOfYear;
}

class LunarMonth {
  int month;
  int days;
  bool isLeap;

  LunarMonth({
    required this.month,
    required this.days,
    required this.isLeap,
  });
}

List<LunarMonth> getNumberOfDaysInLunarMonths(int year) {
  final List<LunarMonth> listAllLunarDaysOfYear = [];

  LunarDateTime lunarDate = LunarDateTime(
    year: year,
    month: 1,
    day: 1,
  );

  int days = 1;
  bool isLeap = false;

  do {
    LunarDateTime? nextLunarDate = FullCalenderExtension.getLunarDateNext(
        fromDate: lunarDate, rangeDays: 1);
    if (nextLunarDate!.day < lunarDate.day) {
      listAllLunarDaysOfYear.add(
        LunarMonth(
          month: lunarDate.month,
          days: days,
          isLeap: isLeap,
        ),
      );
      days = 1;
      isLeap = nextLunarDate.isLeap ? true : false;
    } else {
      days++;
    }
    lunarDate = nextLunarDate;
  } while (lunarDate.year == year);

  return listAllLunarDaysOfYear;
}

bool isHasSixWeeksInMonth(DateTime month) {
  final firstDayOfMonth = DateTime(month.year, month.month, 1);
  final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
  
  return (firstDayOfMonth.weekday == 7 && daysInMonth == 30) || 
         ((firstDayOfMonth.weekday == 6 || firstDayOfMonth.weekday == 7) && daysInMonth == 31);
}

List<MarkedDate> getMarkedDatesFromEvents(List<BasedEvent> events) {
  final groupedEvents = events.fold<Map<DateTime, Set<EventCategory>>>(
    {},
    (map, event) {
      final date = DateTime(
        event.startDate.year,
        event.startDate.month,
        event.startDate.day,
      );

      map.putIfAbsent(date, () => <EventCategory>{});
      map[date]!.add(event.eventCategory);
      return map;
    },
  );

  return groupedEvents.entries.map((entry) {
    final date = entry.key;
    final categories = entry.value;

    final colors = categories
        .map((category) {
          switch (category) {
            case EventCategory.religionEvent:
              return AriesColor.yellowP300;
            case EventCategory.specialEvent:
              return AriesColor.success200;
            default:
              return AriesColor.purple;
          }
        })
        .toSet()
        .toList();

    return MarkedDate(
      date: date,
      markedColors: colors,
    );
  }).toList();
}

List<BasedEvent> getUpcomingEvents(List<BasedEvent> events) {
  final now = DateTime.now();
  if (events.isEmpty) {
    return [];
  }
  return events
      .where((event) => event.startDate.isAfter(now))
      .take(maxEventsHomePage)
      .toList();
}

Color getTextLunarColorInCalendar(
  bool isToday,
  bool isSelected,
  bool isImportant,
) {
  if (isToday) {
    return isImportant ? AriesColor.danger300 : AriesColor.yellowP500;
  }
  if (isSelected) {
    return isImportant ? AriesColor.danger300 : AriesColor.danger100;
  }
  if (isImportant) {
    return AriesColor.danger100;
  }
  return AriesColor.neutral100;
}
