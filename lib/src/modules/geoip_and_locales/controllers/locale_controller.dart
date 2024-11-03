import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

/// A provider that manages and provides access to the app's current locale
@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  static const defaultLocale = Locale('vi');

  @override
  Locale build() {
    return defaultLocale;
  }

  void setLocale(Locale newLocale) {
    state = newLocale;
  }

  String getCurrentLocaleString() {
    final languageCode = state.languageCode;
    final countryCode = state.countryCode;
    return countryCode != null ? '${languageCode}_$countryCode' : languageCode;
  }
}
