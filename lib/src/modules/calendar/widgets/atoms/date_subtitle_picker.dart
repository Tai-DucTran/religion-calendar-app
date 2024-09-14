import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DateSubtitlePicker extends StatelessWidget {
  const DateSubtitlePicker({
    super.key,
    required this.locale,
    required this.selectedDate,
  });

  final String locale;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${LocalizedKeys.calendarTypeLunarText} ${getFullLunarDateText(
        locale: locale,
        inputDate: selectedDate,
        dateFormat: (DateTimeFormat.dateShortMonthYear),
      )}',
      style: AriesTextStyles.textBodySmall,
    );
  }
}
