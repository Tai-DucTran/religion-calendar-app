import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:rrule/rrule.dart';

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
    required String repeatFrequencyAt,
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

extension RepeatFrequencyExtension on RepeatFrequency {
  RecurrenceRule? toRecurrenceRule() {
    switch (this) {
      case RepeatFrequency.daily:
        return RecurrenceRule(
          frequency: Frequency.daily,
          interval: 1,
        );
      case RepeatFrequency.weekly:
        return RecurrenceRule(
          frequency: Frequency.weekly,
          interval: 1,
        );
      case RepeatFrequency.biweekly:
        return RecurrenceRule(
          frequency: Frequency.weekly,
          interval: 2,
        );
      case RepeatFrequency.monthly:
        return RecurrenceRule(
          frequency: Frequency.monthly,
          interval: 1,
        );
      case RepeatFrequency.yearly:
        return RecurrenceRule(
          frequency: Frequency.yearly,
          interval: 1,
        );
      case RepeatFrequency.doesNotRepeat:
        return null;
    }
  }

  String get localized {
    switch (this) {
      case RepeatFrequency.daily:
        return LocalizedKeys.dailyText;
      case RepeatFrequency.weekly:
        return LocalizedKeys.weeklyText;
      case RepeatFrequency.biweekly:
        return LocalizedKeys.biweeklyText;
      case RepeatFrequency.monthly:
        return LocalizedKeys.monthlyText;
      case RepeatFrequency.yearly:
        return LocalizedKeys.yearlyText;
      case RepeatFrequency.doesNotRepeat:
        return LocalizedKeys.doesNotRepeatText;
    }
  }
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
  @JsonValue('RELIGION_EVENT')
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
      // TODO (TAI): Allow user to create a custom field
      // case EventCategory.customEvent:
      //   return LocalizedKeys.custom;
    }
  }
}
