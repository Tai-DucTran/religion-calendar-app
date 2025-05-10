import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/molecules/molecules.dart';

class FeedbackDetailForm extends ConsumerWidget {
  const FeedbackDetailForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider);

    return Card(
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AriesColor.neutral0,
          borderRadius: BorderRadius.circular(8.r),
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
            FeelingReatesWrapper(),
            AnimatedCrossFade(
              firstChild: SizedBox(height: 0),
              secondChild: ExpandedFeedbackForm(
                isScreenShootFeedback: false,
              ),
              crossFadeState: feedbackFormSetting.isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(
                milliseconds: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
