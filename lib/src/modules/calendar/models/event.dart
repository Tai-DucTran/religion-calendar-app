import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
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
    required String id,
    required String title,
    required CalendarCategory calendarCategory,
    required EventCategory eventCategory,
    @Default(false) bool isAllDay,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required DateTime createdAt,
    required DateTime updatedAt,
    required double remindMeBefore,
    required RepeatFrequency repeatFrequencyAt,
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
        return LocalizedKeys.calendarCategorySolarText;
      case CalendarCategory.lunar:
        return LocalizedKeys.calendarCategoryLunarText;
    }
  }
}

enum EventCategory {
  @JsonValue('RELIGION')
  religionEvent,
  @JsonValue('FAMILY_EVENT')
  familyEvent,
  @JsonValue('BUSINESS_EVENT')
  businessEvent,
  @JsonValue('PERSONAL_EVENT')
  personalEvent,
  @JsonValue('OTHER_EVENT')
  otherEvent,
  // TODO (TAI): Allow user to create a custom field
  // @JsonValue('CUSTOM')
  // customEvent,
}

extension EventCategoryExtension on EventCategory {
  String get localized {
    switch (this) {
      case EventCategory.religionEvent:
        return LocalizedKeys.eventCategoryReligionText;
      case EventCategory.familyEvent:
        return LocalizedKeys.eventCategoryFamilyText;
      case EventCategory.businessEvent:
        return LocalizedKeys.eventCategoryBusinessText;
      case EventCategory.personalEvent:
        return LocalizedKeys.eventCategoryPersonalText;
      case EventCategory.otherEvent:
        return LocalizedKeys.eventCategoryOtherText;
      // case EventCategory.customEvent:
      //   return LocalizedKeys.custom;
    }
  }
}
