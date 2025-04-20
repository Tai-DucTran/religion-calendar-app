import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

class FeedbackTypeButton extends ConsumerWidget {
  const FeedbackTypeButton({
    super.key,
    required this.type,
    required this.label,
    required this.isSelected,
  });

  final FeedbackType type;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final controller = ref.read(feedbackControllerProvider.notifier);
        controller.updateFeedbackType(type);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AriesColor.yellowP950 : AriesColor.neutral10,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          border: Border.all(
            color: isSelected ? AriesColor.yellowP950 : AriesColor.neutral40,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AriesTextStyles.textBodySmall.copyWith(
              color: isSelected ? AriesColor.neutral0 : AriesColor.neutral900,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
