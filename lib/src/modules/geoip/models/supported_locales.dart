import 'dart:ui';

class SupportedLocales {
  static const Locale english = Locale('en', 'US');
  static const Locale vietnamese = Locale('vi', 'VN');

  static const List<Locale> supportedLocales = [
    english,
    vietnamese,
  ];
}

extension SupportedLocalesX on Locale {
  String toLanguageName() {
    return switch (this) {
      SupportedLocales.english => 'English',
      SupportedLocales.vietnamese => 'Tiếng Việt',
      _ => 'English',
    };
  }
}
