import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class PrivacyPolicySettingPage extends StatelessWidget {
  const PrivacyPolicySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: LocalizedKeys.privacyPolicySettingTitleText,
      child: Container(),
    );
  }
}
