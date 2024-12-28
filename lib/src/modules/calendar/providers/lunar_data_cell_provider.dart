import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:full_calender/enums/time_zone.dart';
import 'package:full_calender/full_calender.dart';
import 'package:full_calender/full_calender_extension.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

final lunarCellDataProvider =
    Provider.family<LunarCellData, ({DateTime date, String locale})>(
        (ref, params) {
  final lunarDate = FullCalender(
    date: params.date,
    timeZone: TimeZone.vietnamese.timezone,
  ).lunarDate;

  final isImportant =
      ref.watch(isImportantLunarDayProvider((lunarDate: lunarDate)));
  final formattedText = LunarDateFormatter.format(
    lunarDate,
    isImportant ? DateTimeFormat.dayMonth : DateTimeFormat.day,
    params.locale,
  );

  return LunarCellData(
    formattedText: formattedText,
    isImportant: isImportant,
  );
});

final lunarMonthLastDayProvider =
    Provider.family<LunarDateTime, ({int year, int month})>((ref, params) {
  final firstDateInTheNextMonth = LunarDateTime(
    year: params.year,
    month: params.month + 1,
    day: 01,
  );
  return FullCalenderExtension.getLunarDateNext(
      fromDate: firstDateInTheNextMonth, rangeDays: -1)!;
});

final isImportantLunarDayProvider =
    Provider.family<bool, ({LunarDateTime lunarDate})>((ref, params) {
  if (importantLunarDays.contains(params.lunarDate.day)) {
    return true;
  }

  final lastDayOfMonth = ref.watch(lunarMonthLastDayProvider((
    year: params.lunarDate.year,
    month: params.lunarDate.month,
  )));

  return params.lunarDate.year == lastDayOfMonth.year &&
      params.lunarDate.month == lastDayOfMonth.month &&
      params.lunarDate.day == lastDayOfMonth.day;
});
