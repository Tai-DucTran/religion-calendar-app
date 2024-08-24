import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizedKeys {
  LocalizedKeys._();

  static late BuildContext _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

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
}
