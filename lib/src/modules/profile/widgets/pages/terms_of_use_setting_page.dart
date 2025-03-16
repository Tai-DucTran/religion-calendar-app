import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class TermsOsUseSettingPage extends StatelessWidget {
  const TermsOsUseSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: context.l10n.termsOfUseTitleText,
      child: Container(),
    );
  }
}
