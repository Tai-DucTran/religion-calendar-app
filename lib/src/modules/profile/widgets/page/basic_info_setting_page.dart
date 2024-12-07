import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class BasicInfoSettingPage extends StatelessWidget {
  const BasicInfoSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: LocalizedKeys.editUserInfoButtonText,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenConfig.defaultHorizontalScreenPadding,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UploadProfileImageSection(),
            Spacing.sp30,
            Text(
              LocalizedKeys.firstNameAndLastName,
              style: AriesTextStyles.textBodyNormal,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
