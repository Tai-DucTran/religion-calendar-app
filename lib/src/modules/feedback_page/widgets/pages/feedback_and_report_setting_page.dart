import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_controller.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

class FeedbackAndReportSettingPage extends ConsumerWidget {
  const FeedbackAndReportSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedback = ref.watch(feedbackControllerProvider);

    return SettingPageTemplate(
      header: context.l10n.feebackAndReportSettingTitlText,
      child: Container(
        padding: EdgeInsets.only(
          top: 12.h,
          left: 24.w,
          right: 24.w,
        ),
        child: Column(
          spacing: 18.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How would you rate your experience?',
              style: AriesTextStyles.textBodySmall,
              textAlign: TextAlign.center,
            ),
            _buildFeedbackCard(context, ref, feedback),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackCard(
      BuildContext context, WidgetRef ref, FeedbackForm feedback) {
    final controller = ref.read(feedbackControllerProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AriesColor.neutral0,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AriesColor.neutral900.withValues(
              alpha: 0.1,
            ),
            offset: const Offset(
              0,
              2,
            ),
            blurRadius: 13.4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: FeelingRates.values.map(
              (sentiment) {
                final isSelected = feedback.selectedSentiment == sentiment;
                return AriesIconButton(
                  onClick: () {
                    controller.selectSentiment(sentiment);
                  },
                  iconPath: sentiment.getIconPath(),
                  color: isSelected
                      ? AriesColor.yellowP300
                      : AriesColor.neutral100,
                  size: 40,
                );
              },
            ).toList(),
          ),
          AnimatedCrossFade(
            firstChild: SizedBox(height: 0),
            secondChild: _buildExpandedForm(context, ref, feedback),
            crossFadeState: feedback.isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(
              milliseconds: 300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedForm(
      BuildContext context, WidgetRef ref, FeedbackForm feedback) {
    final controller = ref.read(feedbackControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AriesColor.neutral20),
        Row(
          children: [
            Expanded(
              child: _buildFeedbackTypeSelector(
                context,
                ref,
                FeedbackType.bugReport,
                'Bug Report',
                feedback.feedbackType == FeedbackType.bugReport,
              ),
            ),
            Spacing.sp12,
            Expanded(
              child: _buildFeedbackTypeSelector(
                context,
                ref,
                FeedbackType.featureRecommendation,
                'Suggestion',
                feedback.feedbackType == FeedbackType.featureRecommendation,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'Tell us more',
          style: AriesTextStyles.textBodySmall,
        ),
        SizedBox(height: 8.h),
        TextField(
          onChanged: (value) {
            controller.updateFeedbackText(value);
          },
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Please share your thoughts...',
            hintStyle: AriesTextStyles.textHintTextField,
            fillColor: AriesColor.neutral0,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AriesColor.neutral40),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AriesColor.yellowP300,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AriesColor.neutral40),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: ElevatedButton(
            onPressed: controller.isSubmitEnabled()
                ? () {
                    controller.submitFeedback();
                    _showFeedbackSubmittedDialog(context);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AriesColor.yellowP500,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
                vertical: 12.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              disabledBackgroundColor: AriesColor.neutral40,
            ),
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackTypeSelector(
    BuildContext context,
    WidgetRef ref,
    FeedbackType type,
    String label,
    bool isSelected,
  ) {
    final controller = ref.read(feedbackControllerProvider.notifier);

    return GestureDetector(
      onTap: () {
        controller.updateFeedbackType(type);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AriesColor.yellowP50 : AriesColor.neutral10,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          border: Border.all(
            color: isSelected ? AriesColor.yellowP300 : AriesColor.neutral40,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AriesTextStyles.textBodySmall.copyWith(
              color: isSelected ? AriesColor.yellowP900 : AriesColor.neutral900,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _showFeedbackSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Thank You!'),
        content: Text(
            'Your feedback has been submitted successfully. We appreciate your input.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
