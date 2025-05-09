import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/organisms/organisms.dart';

class FeedbackOrReportDetailsCard extends ConsumerWidget {
  const FeedbackOrReportDetailsCard({
    super.key,
    required this.feedback,
  });

  final FeedbackConversation feedback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackDate = getFullSolarDateText(
      locale: Localizations.localeOf(context).toString(),
      inputDate: feedback.createdAt,
      dateFormat: DateTimeFormat.dateMonthYear,
    );
    final feedbackTitle =
        '${feedback.feedbackType!.getLocalized(context)} - $feedbackDate';

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      color: AriesColor.neutral0,
      child: ListTile(
        title: Text(
          feedbackTitle,
          style: AriesTextStyles.textHeading7.copyWith(
            color: feedback.status?.getColorStatus(),
          ),
        ),
        subtitle: Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedback.feedbackTitle ?? '',
              style: AriesTextStyles.textBodySmall.copyWith(
                color: AriesColor.neutral100,
              ),
            ),
          ],
        ),
        trailing: feedback.status!.getIcon(),
        onTap: () {
          FeedbackStatusDetailsBottomSheet.show(
            context: context,
            conversationId: feedback.id,
            initialFeedback: feedback,
            feedbackTitle: feedbackTitle,
          );
        },
      ),
    );
  }
}
