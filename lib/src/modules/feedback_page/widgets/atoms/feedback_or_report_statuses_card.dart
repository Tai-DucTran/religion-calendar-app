import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class FeedbackOrReportStatusesCard extends StatelessWidget {
  const FeedbackOrReportStatusesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AriesColor.neutral0,
      child: ListTile(
        title: Text(
          context.l10n.feedbackOrReportStatusesText,
          style: AriesTextStyles.textHeading7,
        ),
        subtitle: Text(
          context.l10n.feedbackOrReportStatusesDescText,
          style: TextStyle(
            fontSize: 12,
            color: AriesColor.yellowP950,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: () {},
      ),
    );
  }
}
