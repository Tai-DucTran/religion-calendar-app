import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

class FeelingReatesWrapper extends ConsumerWidget {
  const FeelingReatesWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedback = ref.watch(feedbackControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: FeelingRates.values.map(
        (sentiment) {
          final isSelected = feedback.selectedSentiment == sentiment;
          return AriesIconButton(
            onClick: () {
              final controller = ref.read(feedbackControllerProvider.notifier);
              controller.selectSentiment(sentiment);
            },
            iconPath: sentiment.getIconPath(),
            color: isSelected
                ? feedback.selectedSentiment!.getColor()
                : AriesColor.neutral100,
            size: 40,
          );
        },
      ).toList(),
    );
  }
}
