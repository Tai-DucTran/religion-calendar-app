import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback_by_screenshot/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

/// A form that prompts the user for the type of feedback they want to give,
/// free form text feedback, and a sentiment rating.
/// The submit button is disabled until the user provides the feedback type. All
/// other fields are optional.

class ScreenshotFeedbackForm extends ConsumerStatefulWidget {
  const ScreenshotFeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScreenshotFeedbackFormState();
}

class _ScreenshotFeedbackFormState
    extends ConsumerState<ScreenshotFeedbackForm> {
  @override
  Widget build(BuildContext context) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider);
    final feedbackForm = feedbackFormSetting.feedback;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              if (widget.scrollController != null)
                const FeedbackSheetDragHandle(),
              ListView(
                controller: widget.scrollController,
                padding: EdgeInsets.fromLTRB(
                  16,
                  widget.scrollController != null ? 20 : 16,
                  16,
                  0,
                ),
                children: [
                  Text(
                    context.l10n.whatKindOfFeedbackTitleText,
                    style: AriesTextStyles.textHeading7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DropdownButton<FeedbackType>(
                          value: feedbackForm.feedbackType,
                          items: FeedbackType.values
                              .map(
                                (type) => DropdownMenuItem<FeedbackType>(
                                  value: type,
                                  child: Text(
                                    type.getLocalized(context),
                                    style: AriesTextStyles.textBodySmall,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (feedbackType) {
                            final controller = ref.read(
                                feedbackFormSettingControllerProvider.notifier);
                            controller.updateFeedbackType(feedbackType!);
                          },
                        ),
                      ),
                      FeelingReatesWrapper(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.l10n.whatIsYourFeedbackTitleText,
                    style: AriesTextStyles.textHeading7,
                  ),
                  TextField(
                    cursorColor: AriesColor.neutral60,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 4.h,
                      ),
                      isDense: true,
                      hintStyle: AriesTextStyles.textHintTextField,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AriesColor.neutral40),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AriesColor.neutral50,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AriesColor.neutral40,
                        ),
                      ),
                    ),
                    onChanged: (newFeedback) {
                      final controller = ref
                          .read(feedbackFormSettingControllerProvider.notifier);
                      controller.updateFeedbackText(newFeedback);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: feedbackForm.feedbackType != null
                ? () {
                    widget.onSubmit(
                      feedbackForm.messages.first.toString() ?? '',
                      extras: feedbackForm.toJson(),
                    );
                    ref
                        .read(
                          screenshotFeedbackFormControllerProvider.notifier,
                        )
                        .hideFeedbackForm();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AriesColor.yellowP950,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              disabledBackgroundColor: AriesColor.neutral40,
            ),
            child: Text(
              context.l10n.submitButtonText,
              style: AriesTextStyles.textHeading6.copyWith(
                color: AriesColor.neutral0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
