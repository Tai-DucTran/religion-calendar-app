import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/feedback_form.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class FeedbackStatusDetailsBottomSheet extends ConsumerStatefulWidget {
  const FeedbackStatusDetailsBottomSheet({
    super.key,
    required this.feedbackForm,
    required this.feedbackTitle,
  });

  final FeedbackForm? feedbackForm;
  final String? feedbackTitle;

  static Future<void> show({
    required BuildContext context,
    required FeedbackForm? feedbackForm,
    required String? feedbackTitle,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      enableDrag: true,
      useSafeArea: true,
      isDismissible: true,
      backgroundColor: AriesColor.yellowP25,
      barrierColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      builder: (context) => FeedbackStatusDetailsBottomSheet(
        feedbackForm: feedbackForm,
        feedbackTitle: feedbackTitle,
      ),
    );
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeedbackStatusDetailsBottomSheetState();
}

class _FeedbackStatusDetailsBottomSheetState
    extends ConsumerState<FeedbackStatusDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    if (widget.feedbackForm == null) {
      return SomethingWentWrong();
    }

    final feedback = widget.feedbackForm;
    final isStatusReponded =
        feedback?.status == FeedbackResponseStatus.responded;

    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(
        20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.feedbackTitle ?? "",
                style: AriesTextStyles.textHeading5.copyWith(
                  color: AriesColor.yellowP900,
                ),
              ),
            ),
            Spacing.sp24,
            Text(
              feedback?.feedbackType?.getUserFeedbackTitleLocalized(context) ??
                  context.l10n.detailsText,
              style: AriesTextStyles.textHeading6,
            ),
            Spacing.sp24,
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: AriesColor.neutral30,
                    width: 4.0,
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                left: 12.w,
              ),
              child: ReadMoreText(
                '${feedback?.feedbackText ?? ''}\n',
                trimCollapsedText: context.l10n.readMoreButtonText,
                trimExpandedText: context.l10n.showLessButtonText,
                delimiter: '\n',
                moreStyle: AriesTextStyles.textHeading7.copyWith(
                  color: AriesColor.yellowP900,
                ),
                lessStyle: AriesTextStyles.textHeading7.copyWith(
                  color: AriesColor.yellowP900,
                ),
              ),
            ),
            Spacing.sp24,
            if (feedback?.status != null)
              Row(
                children: [
                  Text(
                    context.l10n.statusText,
                    style: AriesTextStyles.textHeading6,
                  ),
                  Spacing.sp12,
                  feedback!.status!.getIcon(),
                  Spacing.sp8,
                  Container(
                    padding: EdgeInsets.all(
                      6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                      color: isStatusReponded
                          ? AriesColor.success700
                          : AriesColor.neutral600,
                    ),
                    child: Text(
                      feedback.status!.getLocalized(context),
                      style: AriesTextStyles.textBodyNormal.copyWith(
                        color: isStatusReponded
                            ? AriesColor.neutral0
                            : AriesColor.neutral40,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            Spacing.sp24,
          ],
        ),
      ),
    );
  }
}
