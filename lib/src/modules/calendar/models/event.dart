import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

part 'event.freezed.dart';
part 'event.g.dart';

abstract class Event {
  String get id;
  String get title;
  DateTime get startDate;
  DateTime get endDate;
}

@freezed
class UserEvent with _$UserEvent implements Event {
  const factory UserEvent({
    required UserId userId,
    required String id,
    required String title,
    required CalendarCategory calendarCategory,
    required EventCategory eventCategory,
    @Default(false) bool isAllDay,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required double remindMeBefore,
    required RepeatFrequency repeatFrequencyAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserEvent;

  factory UserEvent.fromJson(Map<String, dynamic> json) =>
      _$UserEventFromJson(json);

  const UserEvent._();
}

@freezed
class ReligionEvent with _$ReligionEvent implements Event {
  const factory ReligionEvent({
    required String id,
    required String title,
    required ReligionPreference religion,
    @Default(EventCategory.religionEvent) EventCategory eventCategory,
    required DateTime startDate,
    required DateTime endDate,
    required double remindMeBefore,
    required String description,
    required ImportantLevel level,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReligionEvent;

  factory ReligionEvent.fromJson(Map<String, dynamic> json) =>
      _$ReligionEventFromJson(json);

  const ReligionEvent._();
}

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

enum ImportantLevel {
  @JsonValue('IMPORTANT')
  important,
  @JsonValue('MEDIUM')
  medium,
  @JsonValue('LOW')
  low,
}
