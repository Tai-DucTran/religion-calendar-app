import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/screen_config.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class BasicInfoSettingPage extends StatelessWidget {
  const BasicInfoSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: LocalizedKeys.editUserInfoButtonText,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenConfig.defaultHorizontalScreenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: AriesColor.facebookColor,
              ),
            ),
            Spacing.sp30,
            Text(
              LocalizedKeys.firstNameAndLastName,
              style: AriesTextStyles.textBodyNormal,
            )
          ],
        ),
      ),
    );
  }
}
