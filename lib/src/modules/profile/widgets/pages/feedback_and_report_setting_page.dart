import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class FeedbackAndReportSettingPage extends StatelessWidget {
  const FeedbackAndReportSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingPageTemplate(
      header: LocalizedKeys.feebackAndReportSettingTitlText,
      child: Container(),
    );
  }
}
