import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

class GeneralFeedbackStatusOnBottomSheet extends StatelessWidget {
  const GeneralFeedbackStatusOnBottomSheet({
    super.key,
    required this.feedback,
    required this.feedbackTitle,
  });

  final FeedbackConversation feedback;
  final String feedbackTitle;

  @override
  Widget build(BuildContext context) {
    final isStatusReponded =
        feedback.status == FeedbackResponseStatus.responded;
    final hasAttachedImage = feedback.hasFeedbackImage;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            feedbackTitle,
            style: AriesTextStyles.textHeading5.copyWith(
              color: AriesColor.yellowP900,
            ),
          ),
        ),
        Spacing.sp24,
        Text(
          feedback.feedbackType?.getUserFeedbackTitleLocalized(context) ??
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
            '${feedback.feedbackTitle ?? ''}\n',
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
        if (feedback.status != null)
          Row(
            children: [
              Text(
                context.l10n.statusText,
                style: AriesTextStyles.textHeading6,
              ),
              Spacing.sp12,
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 6,
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
                        : AriesColor.neutral10,
                    fontSize: 12,
                  ),
                ),
              ),
              Spacing.sp12,
              if (hasAttachedImage)
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AriesColor.yellowP900,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Image',
                          style: AriesTextStyles.textBodyNormal.copyWith(
                            color: isStatusReponded
                                ? AriesColor.neutral0
                                : AriesColor.neutral10,
                            fontSize: 12,
                          ),
                        ),
                        Spacing.sp2,
                        Icon(
                          Icons.attach_file_outlined,
                          size: 14,
                          color: AriesColor.neutral0,
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
