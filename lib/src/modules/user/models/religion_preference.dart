import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

enum ReligionPreference {
  @JsonValue('CATHOLICISM')
  catholicism,
  @JsonValue('BUDDHISM')
  buddhism,
  @JsonValue('UNKNOWN')
  unknown,
}

extension ReligionPrefernceExtension on ReligionPreference {
  String getLocalized(BuildContext context) {
    switch (this) {
      case ReligionPreference.catholicism:
        return context.l10n.religionCatholicismText;
      case ReligionPreference.buddhism:
        return context.l10n.religionBuddhismText;
      case ReligionPreference.unknown:
        return context.l10n.religionUnknownText;
    }
  }

  IconData? get icon {
    switch (this) {
      case ReligionPreference.catholicism:
        return Icons.church_outlined;
      case ReligionPreference.buddhism:
        return Icons.temple_buddhist_outlined;
      case ReligionPreference.unknown:
        return Icons.wb_sunny_outlined;
    }
  }

  String get image {
    switch (this) {
      case ReligionPreference.catholicism:
        return AriesImages.defaultCatholicismEvent;
      case ReligionPreference.buddhism:
        return AriesImages.defaultBuddismEvent;
      case ReligionPreference.unknown:
        return AriesImages.defaultOtherEvent;
    }
  }
}
