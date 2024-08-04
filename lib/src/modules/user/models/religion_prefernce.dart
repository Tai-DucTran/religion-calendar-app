import 'package:freezed_annotation/freezed_annotation.dart';

enum ReligionPreference {
  @JsonValue('CATHOLICISM')
  catholicism,
  @JsonValue('BUDDHISM')
  buddhism,
  @JsonValue('UNKNOWN')
  unknown,
}
