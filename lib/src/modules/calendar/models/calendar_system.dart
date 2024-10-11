// calendar_system.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

part 'calendar_system.freezed.dart';

@freezed
abstract class CalendarSystem with _$CalendarSystem {
  const CalendarSystem._();

  const factory CalendarSystem.solar({
    @Default(7) int defaultTimeZone,
  }) = SolarCalendarSystem;

  const factory CalendarSystem.lunar({
    @Default(7) int defaultTimeZone,
  }) = LunarCalendarSystem;

  String get name {
    return map(
      solar: (_) => LocalizedKeys.calendarCategorySolarText,
      lunar: (_) => LocalizedKeys.calendarCategoryLunarText,
    );
  }

  DateTime now({int? timeZone}) {
    final tz = timeZone ?? defaultTimeZone;
    return map(
      solar: (_) => FullCalender.now(tz).date,
      lunar: (_) {
        final lunarDate = FullCalender.now(tz).lunarDate;
        return DateTime(lunarDate.year, lunarDate.month, lunarDate.day);
      },
    );
  }

  DateTime dateTime(int year, int month, int day, {int? timeZone}) {
    final tz = timeZone ?? defaultTimeZone;
    final FullCalender baseDate =
        FullCalender(date: DateTime(year, month, day), timeZone: tz);
    final LunarDateTime lunarDate = baseDate.lunarDate;

    return map(
      solar: (_) => baseDate.date,
      lunar: (_) => DateTime(
        lunarDate.year,
        lunarDate.month,
        lunarDate.day,
      ),
    );
  }

  int getYear(DateTime date, {int? timeZone}) {
    final tz = timeZone ?? defaultTimeZone;
    return map(
      solar: (_) => FullCalender(date: date, timeZone: tz).date.year,
      lunar: (_) => FullCalender(date: date, timeZone: tz).lunarDate.year,
    );
  }

  int getMonth(DateTime date, {int? timeZone}) {
    final tz = timeZone ?? defaultTimeZone;
    return map(
      solar: (_) => FullCalender(date: date, timeZone: tz).date.month,
      lunar: (_) => FullCalender(date: date, timeZone: tz).lunarDate.month,
    );
  }

  int getDay(DateTime date, {int? timeZone}) {
    final tz = timeZone ?? defaultTimeZone;
    return map(
      solar: (_) => FullCalender(date: date, timeZone: tz).date.day,
      lunar: (_) => FullCalender(date: date, timeZone: tz).lunarDate.day,
    );
  }

  bool isLeapYear(int year) {
    return map(
      solar: (_) => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0),
      lunar: (_) => year % 19 == 0 || year % 19 == 8 || year % 19 == 11,
    );
  }

  int getDaysInMonth(int year, int month) {
    return map(
      solar: (_) => DateTime(year, month + 1, 0).day,
      lunar: (_) {
        final firstDateInTheNextMonth =
            LunarDateTime(year: year, month: month + 1, day: 01);
        return FullCalenderExtension.getLunarDateNext(
                fromDate: firstDateInTheNextMonth, rangeDays: -1)!
            .day;
      },
    );
  }

  List<int> getDaysOfMonthInYear(int year) {
    return map(
      solar: (_) {
        return List.generate(12, (month) => getDaysInMonth(year, month + 1));
      },
      lunar: (_) {
        List<int> daysInMonths = [];
        int month = 1;

        while (true) {
          try {
            int daysInMonth = getDaysInMonth(year, month);
            daysInMonths.add(daysInMonth);
            month++;
          } catch (e) {
            break;
          }
        }

        return daysInMonths;
      },
    );
  }

  String format(DateTime date, String pattern, {String? locale}) {
    return map(
      solar: (_) => DateFormat(pattern, locale).format(date),
      lunar: (_) {
        final lunarDate =
            FullCalender(date: date, timeZone: defaultTimeZone).lunarDate;
        return DateFormat(pattern, locale)
            .format(DateTime(lunarDate.year, lunarDate.month, lunarDate.day));
      },
    );
  }
}
