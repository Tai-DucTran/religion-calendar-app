import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/profile/models/models.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/molecules/molecules.dart';

class GeneralSettingSection extends StatelessWidget {
  const GeneralSettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSection(
      heading: LocalizedKeys.generalSettingsHeaderText,
      settingOptions: generalSettingOptionsList,
    );
  }
}
