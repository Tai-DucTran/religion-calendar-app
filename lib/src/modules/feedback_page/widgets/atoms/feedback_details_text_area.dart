import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class FeedbackDetailsTextArea extends ConsumerWidget {
  const FeedbackDetailsTextArea({
    super.key,
    required this.feedbackTextController,
  });

  final TextEditingController feedbackTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: feedbackTextController,
      onChanged: (value) {
        final controller =
            ref.read(feedbackFormSettingControllerProvider.notifier);
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
    );
  }
}
