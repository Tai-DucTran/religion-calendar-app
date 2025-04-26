// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8,
              ),
              child: Image.asset(
                width: 350,
                height: 350,
                AriesImages.emptyStateSpiritual,
              ),
            ),
            Spacing.sp20,
            Text(
              context.l10n.noDataFoundTitleText,
              style: AriesTextStyles.textHeading4.copyWith(
                color: AriesColor.yellowP950,
              ),
            ),
            Spacing.sp4,
            Text(
              subTitle,
              style: AriesTextStyles.textBodySmall.copyWith(
                overflow: TextOverflow.visible,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
