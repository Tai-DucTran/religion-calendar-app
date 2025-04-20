import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

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
          'Feedback or Report Statuses',
          style: AriesTextStyles.textHeading7,
        ),
        subtitle: Text(
          'See all your feedbacks/reports response',
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
