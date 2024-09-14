import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

enum ReligionPreference {
  @JsonValue('CATHOLICISM')
  catholicism,
  @JsonValue('BUDDHISM')
  buddhism,
  @JsonValue('UNKNOWN')
  unknown,
}

extension ReligionPrefernceExtension on ReligionPreference {
  String get localized {
    switch (this) {
      case ReligionPreference.catholicism:
        return LocalizedKeys.religionCatholicismText;
      case ReligionPreference.buddhism:
        return LocalizedKeys.religionBuddhismText;
      case ReligionPreference.unknown:
      default:
        return LocalizedKeys.religionUnknownText;
    }
  }
}
