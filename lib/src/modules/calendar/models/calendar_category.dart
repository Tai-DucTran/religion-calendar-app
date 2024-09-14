import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

enum CalendarCategory {
  @JsonValue('SOLAR')
  solar,
  @JsonValue('LUNAR')
  lunar,
}

extension CalendarCategoryExtension on CalendarCategory {
  String get localized {
    switch (this) {
      case CalendarCategory.solar:
        return LocalizedKeys.calendarTypeSolarText;
      case CalendarCategory.lunar:
        return LocalizedKeys.calendarTypeLunarText;
    }
  }
}
