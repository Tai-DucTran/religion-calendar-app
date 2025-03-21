import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

class DateSubtitlePicker extends StatelessWidget {
  const DateSubtitlePicker({
    super.key,
    required this.locale,
    required this.selectedDate,
    required this.isLunarCalendar,
  });

  final String locale;
  final DateTime selectedDate;
  final bool isLunarCalendar;

  @override
  Widget build(BuildContext context) {
    final calendarCategoryLabel = isLunarCalendar
        ? context.l10n.calendarCategorySolarText
        : context.l10n.calendarCategoryLunarText;

    return Text(
      '$calendarCategoryLabel ${getFullLunarDateText(
        locale: locale,
        inputDate: selectedDate,
        dateFormat: (DateTimeFormat.dateMonth),
      )}',
      style: AriesTextStyles.textBodySmall,
    );
  }
}
