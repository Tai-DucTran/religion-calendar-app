import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_form_setting_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ExpandedFeedbackForm extends HookConsumerWidget {
  const ExpandedFeedbackForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider).feedback;
    final controller = ref.read(feedbackFormSettingControllerProvider.notifier);

    final isSubmitting = useState(false);
    final feedbackTextController = useTextEditingController();

    return Column(
      children: [
        SizedBox(height: 12.h),
        Divider(color: AriesColor.neutral20),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: FeedbackTypeButton(
                type: FeedbackType.bugReport,
                label: FeedbackType.bugReport.getLocalized(context),
                isSelected:
                    feedbackFormSetting.feedbackType == FeedbackType.bugReport,
              ),
            ),
            SizedBox(width: 12.w),
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
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            context.l10n.tellUsMoreText,
            style: AriesTextStyles.textBodySmall,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: feedbackTextController,
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
        SizedBox(height: 12.h),
        Center(
          child: CustomElevatedButton(
            onPressedAsync: () async {
              // Prevent multiple submissions
              if (isSubmitting.value) return;

              try {
                // Set submitting state to true
                isSubmitting.value = true;

                // Submit the feedback
                final result = await controller.submitFeedback();

                // Handle the result
                if (result != null && context.mounted) {
                  // Clear the text input
                  feedbackTextController.clear();

                  // Show success dialog
                  _showFeedbackSubmittedDialog(context);
                }
              } finally {
                // Always reset the submitting state
                if (context.mounted) {
                  isSubmitting.value = false;
                }
              }

              return;
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
