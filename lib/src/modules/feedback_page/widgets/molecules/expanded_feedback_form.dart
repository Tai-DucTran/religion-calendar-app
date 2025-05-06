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
    final hasUploadedImage = useState(false);

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

        // Display the uploaded image if any
        if (hasUploadedImage.value)
          Container(
            margin: EdgeInsets.only(bottom: 12.h),
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AriesColor.neutral10,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AriesColor.neutral40),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Image attached",
                    style: AriesTextStyles.textBodySmall.copyWith(
                      color: AriesColor.neutral500,
                    ),
                  ),
                ),
                Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: InkWell(
                    onTap: () {
                      hasUploadedImage.value = false;
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AriesColor.neutral0,
                        shape: BoxShape.circle,
                        border: Border.all(color: AriesColor.neutral40),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 14.sp,
                        color: AriesColor.neutral700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Buttons row
        Row(
          spacing: 8.w,
          children: [
            Expanded(
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

                      // Reset image state
                      hasUploadedImage.value = false;

                      // Show success dialog
                      _showFeedbackSubmittedDialog(context);
                    }
                  } finally {
                    if (context.mounted) {
                      isSubmitting.value = false;
                    }
                  }

                  return;
                },
                height: 40,
                text: context.l10n.submitButtonText,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AriesColor.yellowP50,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AriesColor.yellowP200),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Just for UI demonstration
                    hasUploadedImage.value = true;
                  },
                  borderRadius: BorderRadius.circular(8.r),
                  child: Center(
                    child: Icon(
                      Icons.upload_file_outlined,
                      size: 20.h,
                      color: AriesColor.yellowP950,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
