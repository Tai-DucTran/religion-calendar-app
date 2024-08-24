import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/geoip/models/supported_locales.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum CountryIsoCode {
  vn;

  static CountryIsoCode? fromCode(String? code) {
    return CountryIsoCode.values.firstWhereOrNull(
      (element) => element.code == code,
    );
  }
}

extension CountryCodeIsoCodeX on CountryIsoCode {
  String get code {
    return switch (this) {
      CountryIsoCode.vn => 'VN',
    };
  }

  String get countryName {
    return switch (this) {
      CountryIsoCode.vn => 'Vietnam',
    };
  }

  Locale get locale {
    return switch (this) {
      CountryIsoCode.vn => SupportedLocales.vietnamese,
    };
  }
}
