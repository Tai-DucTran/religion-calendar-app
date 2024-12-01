import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      child: Text(
        LocalizedKeys.userInfoHeaderText,
        style: AriesTextStyles.textHeading4,
      ),
    );
  }
}
