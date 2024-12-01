import 'package:aries/aries.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
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
  themeSetting,
  notificationSetting,
  feedbackAndReportSetting,
  helpAndFAQsSetting,
  termsOfUseSetting,
  privacyPolicySetting,
}

extension SettingOptionsExtension on SettingOptions {
  SettingOptionItem get item {
    final config = switch (this) {
      SettingOptions.religionPreferencesSetting => (
          title: LocalizedKeys.religionPreferencesSettingTitleText,
          iconPath: AriesIcons.start05Icon,
          route: ReligionPreferencesSettingRoute().location,
        ),
      SettingOptions.themeSetting => (
          title: LocalizedKeys.themeSettingTitleText,
          iconPath: AriesIcons.moon01Icon,
          route: ThemeSettingRoute().location,
        ),
      SettingOptions.notificationSetting => (
          title: LocalizedKeys.notificationSettingTitleText,
          iconPath: AriesIcons.bell01Icon,
          route: NotificationSettingRoute().location,
        ),
      SettingOptions.feedbackAndReportSetting => (
          title: LocalizedKeys.feebackAndReportSettingTitlText,
          iconPath: AriesIcons.checkHearIcon,
          route: FeedbackAndReportSettingRoute().location,
        ),
      SettingOptions.helpAndFAQsSetting => (
          title: LocalizedKeys.helpAndFAQsSettingTitleText,
          iconPath: AriesIcons.messageQuestionCircleIcon,
          route: HelpAndFAQsSettingRoute().location,
        ),
      SettingOptions.termsOfUseSetting => (
          title: LocalizedKeys.termsOfUseTitleText,
          iconPath: AriesIcons.file05Icon,
          route: TermsOfUseSettingRoute().location,
        ),
      SettingOptions.privacyPolicySetting => (
          title: LocalizedKeys.privacyPolicySettingTitleText,
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
  SettingOptions.themeSetting,
  SettingOptions.notificationSetting,
];

const contactAndOtherSettingOptionsList = [
  SettingOptions.feedbackAndReportSetting,
  SettingOptions.helpAndFAQsSetting,
  SettingOptions.privacyPolicySetting,
  SettingOptions.privacyPolicySetting
];
