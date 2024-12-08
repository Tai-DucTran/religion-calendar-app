import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class ExplorePageHeader extends StatelessWidget {
  const ExplorePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenConfig.defaultHorizontalScreenPadding,
      ),
      child: Text(
        LocalizedKeys.explorePageHeaderText,
        style: AriesTextStyles.textHeading4,
      ),
    );
  }
}
