import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ScreenshotFeedbackForm extends ConsumerStatefulWidget {
  const ScreenshotFeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  ConsumerState<ScreenshotFeedbackForm> createState() =>
      _ScreenshotFeedbackFormState();
}

class _ScreenshotFeedbackFormState extends ConsumerState<ScreenshotFeedbackForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final _feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(
        milliseconds: 1500,
      ),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    // Listen for changes in text to update the feedback form
    _feedbackController.addListener(_updateFeedbackText);
  }

  @override
  void dispose() {
    _feedbackController.removeListener(_updateFeedbackText);
    _animationController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  void _updateFeedbackText() {
    // Update the feedback text in the controller
    ref
        .read(feedbackFormSettingControllerProvider.notifier)
        .updateFeedbackText(_feedbackController.text);
  }

  void _resetForm() {
    // Clear the text controller
    _feedbackController.clear();

    // Reset the feedback form settings
    ref.read(feedbackFormSettingControllerProvider.notifier).resetForm();
  }

  @override
  Widget build(BuildContext context) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider);
    final controller = ref.read(feedbackFormSettingControllerProvider.notifier);
    final isFormValid =
        controller.isFormValid(feedbackText: _feedbackController.text);

    return Column(
      children: [
        Expanded(
          child: Stack(children: [
            if (widget.scrollController != null)
              const FeedbackSheetDragHandle(),
            Container(
              color: AriesColor.yellowP50,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: ListView(
                controller: widget.scrollController,
                children: [
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0, -_animation.value),
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: AriesColor.yellowP950,
                                size: 24.r,
                              ),
                            ),
                            Text(
                              context.l10n.swipeUpFeedbackInstructionText,
                              style: AriesTextStyles.textBodySmall.copyWith(
                                color: AriesColor.yellowP950,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }),
                  Spacing.sp12,
                  FeelingReatesWrapper(),
                  Spacing.sp32,
                  Row(
                    children: [
                      Expanded(
                        child: FeedbackTypeButton(
                          type: FeedbackType.bugReport,
                          label: FeedbackType.bugReport.getLocalized(context),
                          isSelected:
                              feedbackFormSetting.feedback.feedbackType ==
                                  FeedbackType.bugReport,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: FeedbackTypeButton(
                          type: FeedbackType.featureRecommendation,
                          label: FeedbackType.featureRecommendation
                              .getLocalized(context),
                          isSelected:
                              feedbackFormSetting.feedback.feedbackType ==
                                  FeedbackType.featureRecommendation,
                        ),
                      ),
                    ],
                  ),
                  Spacing.sp12,
                  FeedbackDetailsTextArea(
                    feedbackTextController: _feedbackController,
                  ),
                  Spacing.sp12,

                  // Submit button - disabled when form is invalid
                  CustomElevatedButton(
                    onPressedAsync: isFormValid
                        ? () async {
                            widget.onSubmit(_feedbackController.text);
                            _resetForm();
                          }
                        : null,
                    text: context.l10n.submitButtonText,
                    buttonColor: isFormValid
                        ? AriesColor.yellowP950
                        : AriesColor.neutral70,
                  ),

                  if (!isFormValid)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        context.l10n.pleaseCompleteTheFormText,
                        style: AriesTextStyles.textBodySmall.copyWith(
                          color: AriesColor.neutral400,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
