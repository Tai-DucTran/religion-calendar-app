import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class RepeatedFrequencyText extends StatelessWidget {
  const RepeatedFrequencyText({
    super.key,
    required this.event,
  });

  final BasedEvent event;

  String _getLocalizedFrequencyText(String repeatedFrequencyAt) {
    try {
      if (repeatedFrequencyAt.contains(RepeatedFrequency.daily.name.toUpperCase())) {
        return LocalizedKeys.dailyRepeatedText;
      } else if (repeatedFrequencyAt
          .contains(RepeatedFrequency.weekly.name.toUpperCase())) {
        return LocalizedKeys.weeklyRepeatedText;
      } else if (repeatedFrequencyAt
          .contains(RepeatedFrequency.biweekly.name.toUpperCase())) {
        return LocalizedKeys.biweeklyRepeatedText;
      } else if (repeatedFrequencyAt
          .contains(RepeatedFrequency.monthly.name.toUpperCase())) {
        return LocalizedKeys.monthlyRepeatedText;
      } else if (repeatedFrequencyAt
          .contains(RepeatedFrequency.yearly.name.toUpperCase())) {
        return LocalizedKeys.yearlyRepeatedText;
      }

      return LocalizedKeys.doesNotRepeatText;
    } catch (e) {
      return LocalizedKeys.doesNotRepeatText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final repeatedFrequencyAt = event.repeatedFrequencyAt ?? '';
    
    return Column(
      children: [
        Spacing.sp8,
        Row(
          children: [
            Expanded(
              child: Text(
                _getLocalizedFrequencyText(repeatedFrequencyAt),
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
