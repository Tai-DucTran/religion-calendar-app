import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required this.eventStartDate,
  });

  final DateTime eventStartDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.sp8,
        Row(
          children: [
            Text(
              getFullSolarDateText(
                locale: Localizations.localeOf(context).toString(),
                inputDate: eventStartDate,
                dateFormat: DateTimeFormat.weekDateMonthYear,
              ),
              style: AriesTextStyles.textBodySmall.copyWith(
                color: AriesColor.neutral400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
