import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/geoip_and_locales/models/supported_locales.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:rrule/rrule.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class UserEvent with _$UserEvent {
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
    required String repeatedFrequencyAt,
  }) = _UserEvent;

  factory UserEvent.fromJson(Map<String, dynamic> json) =>
      _$UserEventFromJson(json);

  const UserEvent._();
}

@freezed
class ReligionEvent with _$ReligionEvent {
  const factory ReligionEvent({
    required String id,
    required LocalizedDescription localizedDescription,
    required ImportantLevel importantLevel,
    required DateTime startDate,
    required DateTime endDate,
    required EventCategory eventCategory,
    required CalendarCategory calendarCategory,
    required double remindMeBefore,
    required ReligionPreference religion,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReligionEvent;

  factory ReligionEvent.fromJson(Map<String, dynamic> json) =>
      _$ReligionEventFromJson(json);
}

@freezed
class LocalizedDescription with _$LocalizedDescription {
  const factory LocalizedDescription({
    required LocalizedContent en,
    required LocalizedContent vi,
    LocalizedContent? userEvent,
  }) = _LocalizedDescription;

  factory LocalizedDescription.fromJson(Map<String, dynamic> json) =>
      _$LocalizedDescriptionFromJson(json);
}

@freezed
class LocalizedContent with _$LocalizedContent {
  const factory LocalizedContent({
    required String title,
    required String description,
  }) = _LocalizedContent;

  factory LocalizedContent.fromJson(Map<String, dynamic> json) =>
      _$LocalizedContentFromJson(json);
}

@freezed
class BasedEvent with _$BasedEvent {
  const BasedEvent._();

  const factory BasedEvent({
    required String id,
    required String title,
    required CalendarCategory calendarCategory,
    required EventCategory eventCategory,
    @Default(false) bool isAllDay,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    required double remindMeBefore,
    String? description,
    ImportantLevel? importantLevel,
    String? location,
    String? repeatedFrequencyAt,
  }) = _BasedEvent;

  factory BasedEvent.fromJson(Map<String, dynamic> json) =>
      _$BasedEventFromJson(json);

  factory BasedEvent.fromReligionEvent(
    ReligionEvent event,
    String locale,
  ) {
    final isLocaleEn = locale == SupportedLocales.english.countryCode;
    final title = isLocaleEn
        ? event.localizedDescription.en.title
        : event.localizedDescription.vi.title;
    final description = isLocaleEn
        ? event.localizedDescription.en.description
        : event.localizedDescription.vi.description;

    return BasedEvent(
      id: event.id,
      title: title,
      description: description,
      calendarCategory: event.calendarCategory,
      importantLevel: event.importantLevel,
      startDate: event.startDate,
      endDate: event.endDate,
      eventCategory: event.eventCategory,
      createdAt: event.createdAt,
      updatedAt: event.updatedAt,
      remindMeBefore: event.remindMeBefore,
    );
  }

  factory BasedEvent.fromUserEvent(
    UserEvent event,
  ) {
    return BasedEvent(
      id: event.id,
      title: event.title,
      calendarCategory: event.calendarCategory,
      eventCategory: event.eventCategory,
      isAllDay: event.isAllDay,
      startDate: event.startDate,
      endDate: event.endDate,
      location: event.location,
      createdAt: event.createdAt,
      updatedAt: event.updatedAt,
      remindMeBefore: event.remindMeBefore,
      repeatedFrequencyAt: event.repeatedFrequencyAt,
    );
  }
}

enum RepeatedFrequency {
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

extension RepeatedFrequencyExtension on RepeatedFrequency {
  RecurrenceRule? toRecurrenceRule() {
    switch (this) {
      case RepeatedFrequency.daily:
        return RecurrenceRule(
          frequency: Frequency.daily,
          interval: 1,
        );
      case RepeatedFrequency.weekly:
        return RecurrenceRule(
          frequency: Frequency.weekly,
          interval: 1,
        );
      case RepeatedFrequency.biweekly:
        return RecurrenceRule(
          frequency: Frequency.weekly,
          interval: 2,
        );
      case RepeatedFrequency.monthly:
        return RecurrenceRule(
          frequency: Frequency.monthly,
          interval: 1,
        );
      case RepeatedFrequency.yearly:
        return RecurrenceRule(
          frequency: Frequency.yearly,
          interval: 1,
        );
      case RepeatedFrequency.doesNotRepeat:
        return null;
    }
  }

  String get localized {
    switch (this) {
      case RepeatedFrequency.daily:
        return LocalizedKeys.dailyText;
      case RepeatedFrequency.weekly:
        return LocalizedKeys.weeklyText;
      case RepeatedFrequency.biweekly:
        return LocalizedKeys.biweeklyText;
      case RepeatedFrequency.monthly:
        return LocalizedKeys.monthlyText;
      case RepeatedFrequency.yearly:
        return LocalizedKeys.yearlyText;
      case RepeatedFrequency.doesNotRepeat:
        return LocalizedKeys.doesNotRepeatText;
    }
  }
}

enum RemindMeBeforeOptions {
  @JsonValue('AT_TIME')
  atTime,
  @JsonValue('TEN_MINUTES')
  tenMinutes,
  @JsonValue('THIRTHY_MINUTES')
  thirtyMinutes,
  @JsonValue('ONE_HOUR')
  oneHour,
  @JsonValue('ONE_DAY')
  oneDay,
  @JsonValue('THREE_DAYS')
  threeDays,
  @JsonValue('ONE_WEEK')
  oneWeek,
}

extension RemindMeBeforeOptionsExtension on RemindMeBeforeOptions {
  String get localized {
    switch (this) {
      case RemindMeBeforeOptions.atTime:
        return LocalizedKeys.atTimeOfEventText;
      case RemindMeBeforeOptions.tenMinutes:
        return LocalizedKeys.tenMinutesText;
      case RemindMeBeforeOptions.thirtyMinutes:
        return LocalizedKeys.thirtyMinutesText;
      case RemindMeBeforeOptions.oneHour:
        return LocalizedKeys.oneHourText;
      case RemindMeBeforeOptions.oneDay:
        return LocalizedKeys.oneDayText;
      case RemindMeBeforeOptions.threeDays:
        return LocalizedKeys.threeDaysText;
      case RemindMeBeforeOptions.oneWeek:
        return LocalizedKeys.oneWeekText;
    }
  }

  double get fromStringToDouble {
    switch (this) {
      case RemindMeBeforeOptions.atTime:
        return 0;
      case RemindMeBeforeOptions.tenMinutes:
        return 10 / 60;
      case RemindMeBeforeOptions.thirtyMinutes:
        return 0.5;
      case RemindMeBeforeOptions.oneHour:
        return 1;
      case RemindMeBeforeOptions.oneDay:
        return 24;
      case RemindMeBeforeOptions.threeDays:
        return 24 * 3;
      case RemindMeBeforeOptions.oneWeek:
        return 24 * 7;
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
    }
  }
}
