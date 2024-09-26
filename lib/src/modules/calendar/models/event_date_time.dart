import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_date_time.freezed.dart';
part 'event_date_time.g.dart';

@freezed
class EventDateTime with _$EventDateTime {
  const factory EventDateTime({
    required DateTime startDate,
    required DateTime? startTime,
    required DateTime endDate,
    required DateTime? endTime,
  }) = _EventDateTime;

  factory EventDateTime.fromJson(Map<String, dynamic> json) =>
      _$EventDateTimeFromJson(json);

  const EventDateTime._();
}
