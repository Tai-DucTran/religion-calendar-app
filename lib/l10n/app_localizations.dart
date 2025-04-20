import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @religionCatholicismText.
  ///
  /// In en, this message translates to:
  /// **'Catholicism'**
  String get religionCatholicismText;

  /// No description provided for @religionBuddhismText.
  ///
  /// In en, this message translates to:
  /// **'Buddhism'**
  String get religionBuddhismText;

  /// No description provided for @religionUnknownText.
  ///
  /// In en, this message translates to:
  /// **'Other / None'**
  String get religionUnknownText;

  /// No description provided for @religionText.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get religionText;

  /// No description provided for @whatIsYourReligion.
  ///
  /// In en, this message translates to:
  /// **'What is your religion?'**
  String get whatIsYourReligion;

  /// No description provided for @myReligionIs.
  ///
  /// In en, this message translates to:
  /// **'My Religion is...'**
  String get myReligionIs;

  /// No description provided for @youWantToHaveYourReligion.
  ///
  /// In en, this message translates to:
  /// **'You want to have your religion?'**
  String get youWantToHaveYourReligion;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email!'**
  String get enterYourEmailHint;

  /// No description provided for @invalidEmailText.
  ///
  /// In en, this message translates to:
  /// **'Your email is invalid, try again'**
  String get invalidEmailText;

  /// No description provided for @emailAlreadyInUseTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Already in Use'**
  String get emailAlreadyInUseTitle;

  /// No description provided for @googleEmailAlreadyInUseMessage.
  ///
  /// In en, this message translates to:
  /// **'This email is associated with a Google account that has been previously registered. Please log in to continue.'**
  String get googleEmailAlreadyInUseMessage;

  /// No description provided for @emailAlreadyInUseMessage.
  ///
  /// In en, this message translates to:
  /// **'This email is associated with an account that has been previously registered. Please log in to continue.'**
  String get emailAlreadyInUseMessage;

  /// No description provided for @passWord.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passWord;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @alreadyAMember.
  ///
  /// In en, this message translates to:
  /// **'Already a member?'**
  String get alreadyAMember;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @homeNavItemText.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNavItemText;

  /// No description provided for @calendarNavItemText.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarNavItemText;

  /// No description provided for @exploreNavItemText.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get exploreNavItemText;

  /// No description provided for @profileNavItemText.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileNavItemText;

  /// No description provided for @todayText.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayText;

  /// No description provided for @yourEventText.
  ///
  /// In en, this message translates to:
  /// **'Events in month'**
  String get yourEventText;

  /// No description provided for @dayLeftText.
  ///
  /// In en, this message translates to:
  /// **'day left'**
  String get dayLeftText;

  /// No description provided for @daysLeftText.
  ///
  /// In en, this message translates to:
  /// **'days left'**
  String get daysLeftText;

  /// No description provided for @eventInputHintText.
  ///
  /// In en, this message translates to:
  /// **'What is event name?'**
  String get eventInputHintText;

  /// No description provided for @eventCategoryFamilyText.
  ///
  /// In en, this message translates to:
  /// **'Family event'**
  String get eventCategoryFamilyText;

  /// No description provided for @eventCategoryReligionText.
  ///
  /// In en, this message translates to:
  /// **'Religion event'**
  String get eventCategoryReligionText;

  /// No description provided for @eventCategorySpecialText.
  ///
  /// In en, this message translates to:
  /// **'Special event'**
  String get eventCategorySpecialText;

  /// No description provided for @eventCategoryBusinessText.
  ///
  /// In en, this message translates to:
  /// **'Business event'**
  String get eventCategoryBusinessText;

  /// No description provided for @eventCategoryPersonalText.
  ///
  /// In en, this message translates to:
  /// **'Personal event'**
  String get eventCategoryPersonalText;

  /// No description provided for @eventCategoryOtherText.
  ///
  /// In en, this message translates to:
  /// **'Other event'**
  String get eventCategoryOtherText;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'custom'**
  String get custom;

  /// No description provided for @allDayToggleText.
  ///
  /// In en, this message translates to:
  /// **'All day?'**
  String get allDayToggleText;

  /// No description provided for @allDayText.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get allDayText;

  /// No description provided for @fromText.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get fromText;

  /// No description provided for @toText.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get toText;

  /// No description provided for @eventTimeAt.
  ///
  /// In en, this message translates to:
  /// **'at'**
  String get eventTimeAt;

  /// No description provided for @eventLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Location?'**
  String get eventLocationHint;

  /// No description provided for @eventLocation.
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get eventLocation;

  /// No description provided for @eventFrequentReminder.
  ///
  /// In en, this message translates to:
  /// **'Remind me by:'**
  String get eventFrequentReminder;

  /// No description provided for @eventRemindMeBefore.
  ///
  /// In en, this message translates to:
  /// **'Remind me:'**
  String get eventRemindMeBefore;

  /// No description provided for @atTimeOfEventText.
  ///
  /// In en, this message translates to:
  /// **'At the time of event'**
  String get atTimeOfEventText;

  /// No description provided for @tenMinutesText.
  ///
  /// In en, this message translates to:
  /// **'10 minutes'**
  String get tenMinutesText;

  /// No description provided for @thirtyMinutesText.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get thirtyMinutesText;

  /// No description provided for @oneHourText.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get oneHourText;

  /// No description provided for @oneDayText.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get oneDayText;

  /// No description provided for @threeDaysText.
  ///
  /// In en, this message translates to:
  /// **'3 days'**
  String get threeDaysText;

  /// No description provided for @oneWeekText.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get oneWeekText;

  /// No description provided for @sharingEventButtonText.
  ///
  /// In en, this message translates to:
  /// **'Share with my family?'**
  String get sharingEventButtonText;

  /// No description provided for @viewAllButtonText.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAllButtonText;

  /// No description provided for @selectButtonText.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get selectButtonText;

  /// No description provided for @submitHereButtonText.
  ///
  /// In en, this message translates to:
  /// **'Submit here'**
  String get submitHereButtonText;

  /// No description provided for @calendarCategorySolarText.
  ///
  /// In en, this message translates to:
  /// **'Solar calendar'**
  String get calendarCategorySolarText;

  /// No description provided for @calendarCategoryLunarText.
  ///
  /// In en, this message translates to:
  /// **'Lunar calendar'**
  String get calendarCategoryLunarText;

  /// No description provided for @calendarCategoryLunarAcronymText.
  ///
  /// In en, this message translates to:
  /// **'Lunar'**
  String get calendarCategoryLunarAcronymText;

  /// No description provided for @dailyText.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get dailyText;

  /// No description provided for @weeklyText.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weeklyText;

  /// No description provided for @biweeklyText.
  ///
  /// In en, this message translates to:
  /// **'Biweekly'**
  String get biweeklyText;

  /// No description provided for @monthlyText.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthlyText;

  /// No description provided for @yearlyText.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearlyText;

  /// No description provided for @doesNotRepeatText.
  ///
  /// In en, this message translates to:
  /// **'Does not repeat'**
  String get doesNotRepeatText;

  /// No description provided for @dailyRepeatedText.
  ///
  /// In en, this message translates to:
  /// **'Remind me every day'**
  String get dailyRepeatedText;

  /// No description provided for @weeklyRepeatedText.
  ///
  /// In en, this message translates to:
  /// **'Remind me every week'**
  String get weeklyRepeatedText;

  /// No description provided for @biweeklyRepeatedText.
  ///
  /// In en, this message translates to:
  /// **'Remind me biweekly'**
  String get biweeklyRepeatedText;

  /// No description provided for @monthlyRepeatedText.
  ///
  /// In en, this message translates to:
  /// **'Remind me every month'**
  String get monthlyRepeatedText;

  /// No description provided for @yearlyRepeatedText.
  ///
  /// In en, this message translates to:
  /// **'Remind me every year'**
  String get yearlyRepeatedText;

  /// No description provided for @wordOfWisdom.
  ///
  /// In en, this message translates to:
  /// **'Word of wisdom'**
  String get wordOfWisdom;

  /// No description provided for @emptyEventText.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t had any events yet!'**
  String get emptyEventText;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionHint;

  /// No description provided for @createEventButtonText.
  ///
  /// In en, this message translates to:
  /// **'Create event'**
  String get createEventButtonText;

  /// No description provided for @updateEventButtonText.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateEventButtonText;

  /// No description provided for @todayEventText.
  ///
  /// In en, this message translates to:
  /// **'Today\'s event'**
  String get todayEventText;

  /// No description provided for @goodMorningText.
  ///
  /// In en, this message translates to:
  /// **'Good morning.'**
  String get goodMorningText;

  /// No description provided for @goodAfternoonText.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon.'**
  String get goodAfternoonText;

  /// No description provided for @goodEveningText.
  ///
  /// In en, this message translates to:
  /// **'Good evening.'**
  String get goodEveningText;

  /// No description provided for @watchFullCalendarText.
  ///
  /// In en, this message translates to:
  /// **'Watch full calendar'**
  String get watchFullCalendarText;

  /// No description provided for @allEventsText.
  ///
  /// In en, this message translates to:
  /// **'All events'**
  String get allEventsText;

  /// No description provided for @loadMoreEventsText.
  ///
  /// In en, this message translates to:
  /// **'Load more events'**
  String get loadMoreEventsText;

  /// No description provided for @userInfoHeaderText.
  ///
  /// In en, this message translates to:
  /// **'Your Information'**
  String get userInfoHeaderText;

  /// No description provided for @editUserInfoButtonText.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editUserInfoButtonText;

  /// No description provided for @userDefaultNameText.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get userDefaultNameText;

  /// No description provided for @preferencesHeaderText.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferencesHeaderText;

  /// No description provided for @religionPreferencesSettingTitleText.
  ///
  /// In en, this message translates to:
  /// **'Your religion preferences'**
  String get religionPreferencesSettingTitleText;

  /// No description provided for @userNameText.
  ///
  /// In en, this message translates to:
  /// **'User name'**
  String get userNameText;

  /// No description provided for @updateButtonText.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateButtonText;

  /// No description provided for @generalSettingsHeaderText.
  ///
  /// In en, this message translates to:
  /// **'General settings'**
  String get generalSettingsHeaderText;

  /// No description provided for @themeSettingTitleText.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSettingTitleText;

  /// No description provided for @notificationSettingTitleText.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationSettingTitleText;

  /// No description provided for @contactSettingHeaderText.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactSettingHeaderText;

  /// No description provided for @feebackAndReportSettingTitlText.
  ///
  /// In en, this message translates to:
  /// **'Feedback & Report'**
  String get feebackAndReportSettingTitlText;

  /// No description provided for @helpAndFAQsSettingTitleText.
  ///
  /// In en, this message translates to:
  /// **'Help & FAQs'**
  String get helpAndFAQsSettingTitleText;

  /// No description provided for @termsOfUseTitleText.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUseTitleText;

  /// No description provided for @privacyPolicySettingTitleText.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicySettingTitleText;

  /// No description provided for @deleteUserAccountButtonText.
  ///
  /// In en, this message translates to:
  /// **'Delete your account'**
  String get deleteUserAccountButtonText;

  /// No description provided for @logoutButtonText.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButtonText;

  /// No description provided for @permissionDeninedText.
  ///
  /// In en, this message translates to:
  /// **'Permission denined'**
  String get permissionDeninedText;

  /// No description provided for @grantAccessToPhotosText.
  ///
  /// In en, this message translates to:
  /// **'Allow access to galery and photos'**
  String get grantAccessToPhotosText;

  /// No description provided for @cancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonText;

  /// No description provided for @openSettingsButtonText.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettingsButtonText;

  /// No description provided for @saveButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonText;

  /// No description provided for @profileUpdatedSuccessfullyText.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccessfullyText;

  /// No description provided for @profileUpdatedFailedText.
  ///
  /// In en, this message translates to:
  /// **'Profile update failed!'**
  String get profileUpdatedFailedText;

  /// No description provided for @eventCreatedSuccessfullyText.
  ///
  /// In en, this message translates to:
  /// **'Event created successfully!'**
  String get eventCreatedSuccessfullyText;

  /// No description provided for @eventCreatedFailedText.
  ///
  /// In en, this message translates to:
  /// **'Event created failed!'**
  String get eventCreatedFailedText;

  /// No description provided for @eventDeletedSuccessfullyText.
  ///
  /// In en, this message translates to:
  /// **'Event deleted successfully!'**
  String get eventDeletedSuccessfullyText;

  /// No description provided for @eventDeletedFailedText.
  ///
  /// In en, this message translates to:
  /// **'Event deleted failed!'**
  String get eventDeletedFailedText;

  /// No description provided for @eventUpdatedSuccessfullyText.
  ///
  /// In en, this message translates to:
  /// **'Event updated successfully!'**
  String get eventUpdatedSuccessfullyText;

  /// No description provided for @eventUpdatedFailedText.
  ///
  /// In en, this message translates to:
  /// **'Event updated failed!'**
  String get eventUpdatedFailedText;

  /// No description provided for @deleteEventButtonText.
  ///
  /// In en, this message translates to:
  /// **'Delete event'**
  String get deleteEventButtonText;

  /// No description provided for @deleteEventConfirmationQuestionText.
  ///
  /// In en, this message translates to:
  /// **'Delete event?'**
  String get deleteEventConfirmationQuestionText;

  /// No description provided for @deleteEventConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'Delete this event'**
  String get deleteEventConfirmationText;

  /// No description provided for @moreDetailsButtonText.
  ///
  /// In en, this message translates to:
  /// **'More details'**
  String get moreDetailsButtonText;

  /// No description provided for @firstQuestionInFAQsTitleText.
  ///
  /// In en, this message translates to:
  /// **'## 1. I accidentally selected the wrong religion, how do I change it?'**
  String get firstQuestionInFAQsTitleText;

  /// No description provided for @firstAnswerInFAQsDescText.
  ///
  /// In en, this message translates to:
  /// **'To change your religion, access your Profile; then select **Your religion preferences** in the **Preferences** section. Finally, reselect your religion.'**
  String get firstAnswerInFAQsDescText;

  /// No description provided for @secondQuestionInFAQsTitleText.
  ///
  /// In en, this message translates to:
  /// **'## 2. How do I create a new event?'**
  String get secondQuestionInFAQsTitleText;

  /// No description provided for @secondAnswerInFAQsADescText.
  ///
  /// In en, this message translates to:
  /// **'To create a new event, access the **Home Page**; then select the yellow circular plus icon in the bottom right corner of the screen. Customize your event information and select **Add** or **Save** event in the top right corner.'**
  String get secondAnswerInFAQsADescText;

  /// No description provided for @thirdQuestionInFAQsTitleText.
  ///
  /// In en, this message translates to:
  /// **'## 3. I see incorrect event or information, how do I report it?'**
  String get thirdQuestionInFAQsTitleText;

  /// No description provided for @fourthQuestionInFAQsTitleText.
  ///
  /// In en, this message translates to:
  /// **'## 4. Does the app store my personal data?'**
  String get fourthQuestionInFAQsTitleText;

  /// No description provided for @thirdAnswerInFAQsDescText.
  ///
  /// In en, this message translates to:
  /// **'Please  submit your feedback in **Feedback & Report** pag. Or please do screen shoot within the **Application**, **Feedback & Report** feature is going to be activated; then please describe the details incorrect information or bugs. Thanks for helping **Application** to be beter!'**
  String get thirdAnswerInFAQsDescText;

  /// No description provided for @fourthAnswerInFAQsDescText.
  ///
  /// In en, this message translates to:
  /// **'Yes, **Application** collects and stores a few user\'s data for analyzing and improving **App Performance** and developing new features. **Application** follow the rules of mobile platforms where our application has been operating; in **iOS** is **Apple Store**; and in **Android** is **Google Play**. Read more our **Terms of use** and **Privacy Policy** in **Profile**!'**
  String get fourthAnswerInFAQsDescText;

  /// No description provided for @fifthQuestionInFAQsTitleText.
  ///
  /// In en, this message translates to:
  /// **'##  5. Does the app plan to support more religion in the future?'**
  String get fifthQuestionInFAQsTitleText;

  /// No description provided for @fifthAnswerInFAQsDescText.
  ///
  /// In en, this message translates to:
  /// **'Yes, we plan to do that. Please submit feedback for us by selecting **Feature Suggestions** and filling out your request. We will analyze and prioritize the top-voted requests for support.'**
  String get fifthAnswerInFAQsDescText;

  /// No description provided for @whatKindOfFeedbackTitleText.
  ///
  /// In en, this message translates to:
  /// **'What kind of feedback do you want to give?'**
  String get whatKindOfFeedbackTitleText;

  /// No description provided for @bugReportText.
  ///
  /// In en, this message translates to:
  /// **'Bug report'**
  String get bugReportText;

  /// No description provided for @featureRecommendationText.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get featureRecommendationText;

  /// No description provided for @whatIsYourFeedbackTitleText.
  ///
  /// In en, this message translates to:
  /// **'What is your feedback?'**
  String get whatIsYourFeedbackTitleText;

  /// No description provided for @feelDislike.
  ///
  /// In en, this message translates to:
  /// **'I don\'t like it'**
  String get feelDislike;

  /// No description provided for @feelBad.
  ///
  /// In en, this message translates to:
  /// **'I\'m feeling bad '**
  String get feelBad;

  /// No description provided for @feelNeutral.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay'**
  String get feelNeutral;

  /// No description provided for @feelLike.
  ///
  /// In en, this message translates to:
  /// **'I like your App'**
  String get feelLike;

  /// No description provided for @feelLove.
  ///
  /// In en, this message translates to:
  /// **'I love it'**
  String get feelLove;

  /// No description provided for @submitButtonText.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButtonText;

  /// No description provided for @closeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonText;

  /// No description provided for @thankYouText.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get thankYouText;

  /// No description provided for @submittedSuccessfullyText.
  ///
  /// In en, this message translates to:
  /// **'Your feedback has been submitted successfully. We appreciate your input.'**
  String get submittedSuccessfullyText;

  /// No description provided for @inputFeedbackContentHintText.
  ///
  /// In en, this message translates to:
  /// **'Please share your thoughts'**
  String get inputFeedbackContentHintText;

  /// No description provided for @tellUsMoreText.
  ///
  /// In en, this message translates to:
  /// **'Tell us more'**
  String get tellUsMoreText;

  /// No description provided for @feedbackOrReportStatusesText.
  ///
  /// In en, this message translates to:
  /// **'Feedback or Report Statuses'**
  String get feedbackOrReportStatusesText;

  /// No description provided for @feedbackOrReportStatusesDescText.
  ///
  /// In en, this message translates to:
  /// **'See all your feedbacks/reports responses'**
  String get feedbackOrReportStatusesDescText;

  /// No description provided for @explorePageHeaderText.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explorePageHeaderText;

  /// No description provided for @completeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeButtonText;

  /// No description provided for @errorLoadingContentText.
  ///
  /// In en, this message translates to:
  /// **'Không thể hiển thị được nội dung'**
  String get errorLoadingContentText;

  /// No description provided for @errorSomethingWentWrongText.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get errorSomethingWentWrongText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
