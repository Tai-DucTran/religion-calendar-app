import 'package:freezed_annotation/freezed_annotation.dart';

enum RepeatFrequency {
  @JsonValue('DAILY')
  daily,
  @JsonValue('WEEKLY')
  weekly,
  @JsonValue('BIWEEKLY')
  biweekly,
  @JsonValue('MONTHLY')
  monthly,
  @JsonValue('YEARLY')
  yearly,
  @JsonValue('DOES_NOT_REPEAT')
  doesNotRepeat,
}
