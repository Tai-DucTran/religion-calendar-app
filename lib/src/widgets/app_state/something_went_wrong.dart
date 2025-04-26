import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:religion_calendar_app/src/widgets/buttons/buttons.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            color: AriesColor.danger300,
            size: 48,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            context.l10n.errorSomethingWentWrongText,
            style: AriesTextStyles.textHeading6,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            context.l10n.errorLoadingContentText,
            style: AriesTextStyles.textBodySmall.copyWith(
              color: AriesColor.neutral600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomElevatedButton(
            width: double.infinity,
            onPressed: () => Navigator.of(context).pop(),
            text: context.l10n.closeButtonText,
          ),
        ],
      ),
    );
  }
}
