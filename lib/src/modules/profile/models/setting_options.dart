import 'package:aries/aries.dart';
import 'package:flutter/widgets.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/router/routes.dart';

class SettingOptionItem {
  final String title;
  final String iconPath;
  final String route;

  SettingOptionItem({
    required this.title,
    required this.iconPath,
    required this.route,
  });
}

enum SettingOptions {
  religionPreferencesSetting,
  notificationSetting,
  feedbackAndReportSetting,
  helpAndFAQsSetting,
  termsOfUseSetting,
  privacyPolicySetting,
}

extension SettingOptionsExtension on SettingOptions {
  SettingOptionItem getItem(BuildContext context) {
    final config = switch (this) {
      SettingOptions.religionPreferencesSetting => (
          title: context.l10n.religionPreferencesSettingTitleText,
          iconPath: AriesIcons.start05Icon,
          route: ReligionPreferencesSettingRoute().location,
        ),
      SettingOptions.notificationSetting => (
          title: context.l10n.notificationSettingTitleText,
          iconPath: AriesIcons.bell01Icon,
          route: NotificationSettingRoute().location,
        ),
      SettingOptions.feedbackAndReportSetting => (
          title: context.l10n.feebackAndReportSettingTitlText,
          iconPath: AriesIcons.checkHearIcon,
          route: FeedbackAndReportSettingRoute().location,
        ),
      SettingOptions.helpAndFAQsSetting => (
          title: context.l10n.helpAndFAQsSettingTitleText,
          iconPath: AriesIcons.messageQuestionCircleIcon,
          route: HelpAndFAQsSettingRoute().location,
        ),
      SettingOptions.termsOfUseSetting => (
          title: context.l10n.termsOfUseTitleText,
          iconPath: AriesIcons.file05Icon,
          route: TermsOfUseSettingRoute().location,
        ),
      SettingOptions.privacyPolicySetting => (
          title: context.l10n.privacyPolicySettingTitleText,
          iconPath: AriesIcons.lock02Icon,
          route: PrivacyPolicySettingRoute().location,
        )
    };

    return SettingOptionItem(
      title: config.title,
      iconPath: config.iconPath,
      route: config.route,
    );
  }
}

const preferencesSettingOptionsList = [
  SettingOptions.religionPreferencesSetting
];

const generalSettingOptionsList = [
  SettingOptions.notificationSetting,
];

const contactAndOtherSettingOptionsList = [
  SettingOptions.feedbackAndReportSetting,
  SettingOptions.helpAndFAQsSetting,
  SettingOptions.termsOfUseSetting,
  SettingOptions.privacyPolicySetting,
];
