import 'package:freezed_annotation/freezed_annotation.dart';

enum RemindMeBefore {
  @JsonValue('THIRTY_MINUTES_BEFORE')
  thirtyMinutesBefore,
  @JsonValue('TEN_MINUTES_BEFORE')
  tenMinutesBefore,
  @JsonValue('ONE_HOUR_BEFORE')
  oneHourBefore,
  @JsonValue('ONE_WEEK_BEFORE')
  oneWeekBefore,
  @JsonValue('CUSTOM')
  custom,
}
