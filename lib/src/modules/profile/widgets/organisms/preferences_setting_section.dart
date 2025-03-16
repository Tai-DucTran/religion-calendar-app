import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/models/models.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/molecules/molecules.dart';

class PreferencesSettingSection extends StatelessWidget {
  const PreferencesSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSection(
      heading: context.l10n.preferencesHeaderText,
      settingOptions: preferencesSettingOptionsList,
    );
  }
}
