import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class RepeatedFrequencyText extends StatelessWidget {
  const RepeatedFrequencyText({
    super.key,
    required this.repeatedFrequencyAt,
  });

  final String repeatedFrequencyAt;

  String _getLocalizedFrequencyText(String repeatedFrequencyAt) {
    try {
      return switch (repeatedFrequencyAt) {
        String s
            when s == RepeatedFrequency.daily.toRecurrenceRule().toString() =>
          LocalizedKeys.dailyRepeatedText,
        String s
            when s == RepeatedFrequency.weekly.toRecurrenceRule().toString() =>
          LocalizedKeys.weeklyRepeatedText,
        String s
            when s ==
                RepeatedFrequency.biweekly.toRecurrenceRule().toString() =>
          LocalizedKeys.biweeklyRepeatedText,
        String s
            when s == RepeatedFrequency.monthly.toRecurrenceRule().toString() =>
          LocalizedKeys.monthlyRepeatedText,
        String s
            when s == RepeatedFrequency.yearly.toRecurrenceRule().toString() =>
          LocalizedKeys.yearlyRepeatedText,
        _ => LocalizedKeys.doesNotRepeatText
      };
    } catch (e) {
      return LocalizedKeys.doesNotRepeatText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.sp8,
        Row(
          children: [
            Expanded(
              child: Text(
                _getLocalizedFrequencyText(
                  repeatedFrequencyAt,
                ),
                maxLines: null,
                style: AriesTextStyles.textBodySmall.copyWith(
                  color: AriesColor.neutral400,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
