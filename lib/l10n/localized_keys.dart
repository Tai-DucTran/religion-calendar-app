import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizedKeys {
  LocalizedKeys._();

  static late BuildContext _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static String get religionCatholicismText => AppLocalizations.of(_context)!.religionCatholicismText;
  static String get religionBuddhismText => AppLocalizations.of(_context)!.religionBuddhismText;
  static String get religionUnknownText => AppLocalizations.of(_context)!.religionUnknownText;
  static String get religionText => AppLocalizations.of(_context)!.religionText;
  static String get whatIsYourReligion => AppLocalizations.of(_context)!.whatIsYourReligion;
  static String get youWantToHaveYourReligion => AppLocalizations.of(_context)!.youWantToHaveYourReligion;
  static String get helloWorld => AppLocalizations.of(_context)!.helloWorld;
  static String get signUp => AppLocalizations.of(_context)!.signUp;
  static String get email => AppLocalizations.of(_context)!.email;
  static String get enterYourEmail => AppLocalizations.of(_context)!.enterYourEmail;
  static String get enterYourEmailHint => AppLocalizations.of(_context)!.enterYourEmailHint;
  static String get invalidEmailText => AppLocalizations.of(_context)!.invalidEmailText;
  static String get emailAlreadyInUseTitle => AppLocalizations.of(_context)!.emailAlreadyInUseTitle;
  static String get googleEmailAlreadyInUseMessage => AppLocalizations.of(_context)!.googleEmailAlreadyInUseMessage;
  static String get emailAlreadyInUseMessage => AppLocalizations.of(_context)!.emailAlreadyInUseMessage;
  static String get passWord => AppLocalizations.of(_context)!.passWord;
  static String get enterYourPassword => AppLocalizations.of(_context)!.enterYourPassword;
  static String get or => AppLocalizations.of(_context)!.or;
  static String get alreadyAMember => AppLocalizations.of(_context)!.alreadyAMember;
  static String get login => AppLocalizations.of(_context)!.login;
  static String get homeNavItemText => AppLocalizations.of(_context)!.homeNavItemText;
  static String get calendarNavItemText => AppLocalizations.of(_context)!.calendarNavItemText;
  static String get exploreNavItemText => AppLocalizations.of(_context)!.exploreNavItemText;
  static String get profileNavItemText => AppLocalizations.of(_context)!.profileNavItemText;
  static String get todayText => AppLocalizations.of(_context)!.todayText;
  static String get yourEventText => AppLocalizations.of(_context)!.yourEventText;
  static String get daysLeftText => AppLocalizations.of(_context)!.daysLeftText;
  static String get eventInputHintText => AppLocalizations.of(_context)!.eventInputHintText;
  static String get eventCategoryFamilyText => AppLocalizations.of(_context)!.eventCategoryFamilyText;
  static String get eventCategoryReligionText => AppLocalizations.of(_context)!.eventCategoryReligionText;
  static String get eventCategoryBusinessText => AppLocalizations.of(_context)!.eventCategoryBusinessText;
  static String get eventCategoryPersonalText => AppLocalizations.of(_context)!.eventCategoryPersonalText;
  static String get eventCategoryOtherText => AppLocalizations.of(_context)!.eventCategoryOtherText;
  static String get custom => AppLocalizations.of(_context)!.custom;
  static String get allDayToggleText => AppLocalizations.of(_context)!.allDayToggleText;
  static String get fromText => AppLocalizations.of(_context)!.fromText;
  static String get toText => AppLocalizations.of(_context)!.toText;
  static String get eventTimeAt => AppLocalizations.of(_context)!.eventTimeAt;
  static String get eventLocationHint => AppLocalizations.of(_context)!.eventLocationHint;
  static String get eventLocation => AppLocalizations.of(_context)!.eventLocation;
  static String get eventFrequentReminder => AppLocalizations.of(_context)!.eventFrequentReminder;
  static String get eventRemindMeBefore => AppLocalizations.of(_context)!.eventRemindMeBefore;
  static String get sharingEventButtonText => AppLocalizations.of(_context)!.sharingEventButtonText;
  static String get viewAllButtonText => AppLocalizations.of(_context)!.viewAllButtonText;
  static String get selectButtonText => AppLocalizations.of(_context)!.selectButtonText;
  static String get submitHereButtonText => AppLocalizations.of(_context)!.submitHereButtonText;
  static String get calendarCategorySolarText => AppLocalizations.of(_context)!.calendarCategorySolarText;
  static String get calendarCategoryLunarText => AppLocalizations.of(_context)!.calendarCategoryLunarText;
  static String get dailyText => AppLocalizations.of(_context)!.dailyText;
  static String get weeklyText => AppLocalizations.of(_context)!.weeklyText;
  static String get biweeklyText => AppLocalizations.of(_context)!.biweeklyText;
  static String get monthlyText => AppLocalizations.of(_context)!.monthlyText;
  static String get yearlyText => AppLocalizations.of(_context)!.yearlyText;
  static String get doesNotRepeatText => AppLocalizations.of(_context)!.doesNotRepeatText;
  static String get wordOfWisdom => AppLocalizations.of(_context)!.wordOfWisdom;
}
