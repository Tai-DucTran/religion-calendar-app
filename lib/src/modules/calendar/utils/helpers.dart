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

  return LunarDateFormatter.format(
    lunarDate,
    dateFormat ?? DateTimeFormat.dateMonthYear,
    locale,
  );
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
  bool startWithMonday = true,
}) {
  final dateFormat = DateFormat(isShortName ? 'EEE' : 'EEEE', locale);
  final weekdays = isShortName && locale == 'vi'
      ? dateFormat.dateSymbols.NARROWWEEKDAYS
      : dateFormat.dateSymbols.WEEKDAYS;

  if (startWithMonday) {
    return [...weekdays.sublist(1), weekdays.first];
  }
  return weekdays;
}

List<Map<int, int?>> getNumberOfDaysInLunarMonths(
  int year,
) {
  final List<Map<int, int?>> numberOfDaysInMonths = [];
  for (int i = 0; i <= 12; i++) {
    final numberOfDays = FullCalenderExtension.getLunarDateNext(
      fromDate: LunarDateTime(
        year: year,
        month: i + 1,
        day: 1,
      ),
      rangeDays: -1,
    )?.day;

    final daysInMonth = {i: numberOfDays};
    numberOfDaysInMonths.add(daysInMonth);
  }

  return numberOfDaysInMonths;
}

bool isImportantDay(LunarDateTime lunarDate) {
  final numberOfDaysInMonths = getNumberOfDaysInLunarMonths(lunarDate.year);
  final lastDayInMonths =
      numberOfDaysInMonths[lunarDate.month].entries.first.value;

  final lunarDay = lunarDate.day;

  return importantLunarDays.contains(lunarDay) || lunarDay == lastDayInMonths;
}
