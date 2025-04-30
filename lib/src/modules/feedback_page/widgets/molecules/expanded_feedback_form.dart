import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_form_setting_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ExpandedFeedbackForm extends ConsumerWidget {
  const ExpandedFeedbackForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider).feedback;
    final controller = ref.read(feedbackFormSettingControllerProvider.notifier);

    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AriesColor.neutral20),
        Row(
          spacing: 12.w,
          children: [
            Expanded(
              child: FeedbackTypeButton(
                type: FeedbackType.bugReport,
                label: FeedbackType.bugReport.getLocalized(context),
                isSelected:
                    feedbackFormSetting.feedbackType == FeedbackType.bugReport,
              ),
            ),
            Expanded(
              child: FeedbackTypeButton(
                type: FeedbackType.featureRecommendation,
                label: FeedbackType.featureRecommendation.getLocalized(context),
                isSelected: feedbackFormSetting.feedbackType ==
                    FeedbackType.featureRecommendation,
              ),
            ),
          ],
        ),
        Text(
          context.l10n.tellUsMoreText,
          style: AriesTextStyles.textBodySmall,
        ),
        TextField(
          onChanged: (value) {
            controller.updateFeedbackText(value);
          },
          maxLines: 4,
          style: AriesTextStyles.textBodySmall,
          decoration: InputDecoration(
            hintText: context.l10n.inputFeedbackContentHintText,
            hintStyle: AriesTextStyles.textBodySmall.copyWith(
              color: AriesColor.neutral300,
            ),
            fillColor: AriesColor.neutral0,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AriesColor.neutral40),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AriesColor.yellowP950,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AriesColor.neutral40),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),
        Center(
          child: CustomElevatedButton(
            onPressedAsync: () async {
              await controller.submitFeedback();
              if (context.mounted) {
                _showFeedbackSubmittedDialog(context);
              }
            },
            width: double.infinity,
            height: 40,
            text: context.l10n.submitButtonText,
          ),
        ),
      ],
    );
  }

  void _showFeedbackSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AriesColor.neutral0,
        title: Text(
          context.l10n.thankYouText,
        ),
        content: Text(
          context.l10n.submittedSuccessfullyText,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              context.l10n.closeButtonText,
              style: TextStyle(
                color: AriesColor.yellowP950,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
