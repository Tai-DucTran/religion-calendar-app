import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

class FeelingReatesWrapper extends ConsumerWidget {
  const FeelingReatesWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider).feedbackForm;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: FeelingRates.values.map(
        (sentiment) {
          final isSelected = feedbackFormSetting.selectedSentiment == sentiment;
          return AriesIconButton(
            onClick: () {
              final controller =
                  ref.read(feedbackFormSettingControllerProvider.notifier);
              controller.selectSentiment(sentiment);
              controller.toggleExpanded(true);
            },
            iconPath: sentiment.getIconPath(),
            color: isSelected
                ? feedbackFormSetting.selectedSentiment!.getColor()
                : AriesColor.neutral100,
            size: 40,
          );
        },
      ).toList(),
    );
  }
}
