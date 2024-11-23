import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
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

  IconData? get icon {
    switch (this) {
      case ReligionPreference.catholicism:
        return Icons.church_outlined;
      case ReligionPreference.buddhism:
        return Icons.temple_buddhist_outlined;
      case ReligionPreference.unknown:
      default:
        return Icons.wb_sunny_outlined;
    }
  }

  String get image {
    switch (this) {
      case ReligionPreference.catholicism:
        return AriesImages.christImage;
      case ReligionPreference.buddhism:
        return AriesImages.buddaImage;
      case ReligionPreference.unknown:
      default:
        return AriesImages.sunAndMoonImage;
    }
  }
}
