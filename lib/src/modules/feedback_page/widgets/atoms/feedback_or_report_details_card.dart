import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/organisms/organisms.dart';

class FeedbackOrReportDetailsCard extends StatelessWidget {
  const FeedbackOrReportDetailsCard({
    super.key,
    required this.feedback,
  });

  final FeedbackForm feedback;

  @override
  Widget build(BuildContext context) {
    final feedbackDate = getFullSolarDateText(
      locale: Localizations.localeOf(context).toString(),
      inputDate: feedback.createdAt,
      dateFormat: DateTimeFormat.dateMonthYear,
    );
    final feedbackTitle =
        '${feedback.feedbackType!.getLocalized(context)} - $feedbackDate';
    final isStatusResponded =
        feedback.status == FeedbackResponseStatus.responded;

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
            color: isStatusResponded
                ? AriesColor.success600
                : AriesColor.neutral200,
          ),
        ),
        subtitle: Column(
          spacing: 4.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedback.feedbackText ?? '',
              style: AriesTextStyles.textBodySmall.copyWith(
                color: AriesColor.neutral100,
              ),
            ),
          ],
        ),
        trailing: feedback.status!.getIcon(),
        onTap: () async {
          FeedbackStatusDetailsBottomSheet.show(
            context: context,
            feedbackForm: feedback,
            feedbackTitle: feedbackTitle,
          );
        },
      ),
    );
  }
}
