import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class ExceedMaxConsecutiveMessages extends StatelessWidget {
  const ExceedMaxConsecutiveMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        bottom: 12.h,
      ),
      child: Text(
        context.l10n.exceededMaxSendingMessageText,
        style: AriesTextStyles.textBodySmall.copyWith(
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
