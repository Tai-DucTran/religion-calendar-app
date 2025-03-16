import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/app_localizations.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class RepeatedFrequencyText extends StatelessWidget {
  const RepeatedFrequencyText({
    super.key,
    required this.repeatedFrequencyAt,
  });

  final String repeatedFrequencyAt;

  String _getLocalizedFrequencyText(
      String repeatedFrequencyAt, BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    try {
      return switch (repeatedFrequencyAt) {
        String s
            when s == RepeatedFrequency.daily.toRecurrenceRule().toString() =>
          l10n.dailyRepeatedText,
        String s
            when s == RepeatedFrequency.weekly.toRecurrenceRule().toString() =>
          l10n.weeklyRepeatedText,
        String s
            when s ==
                RepeatedFrequency.biweekly.toRecurrenceRule().toString() =>
          l10n.biweeklyRepeatedText,
        String s
            when s == RepeatedFrequency.monthly.toRecurrenceRule().toString() =>
          l10n.monthlyRepeatedText,
        String s
            when s == RepeatedFrequency.yearly.toRecurrenceRule().toString() =>
          l10n.yearlyRepeatedText,
        _ => l10n.doesNotRepeatText
      };
    } catch (e) {
      return l10n.doesNotRepeatText;
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
                  context,
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
