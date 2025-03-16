import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/app_localizations.dart';
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
    required String description,
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
    required int importantLevel,
    required DateTime startDate,
    required DateTime endDate,
    required EventCategory eventCategory,
    required CalendarCategory calendarCategory,
    required double remindMeBefore,
    required ReligionPreference religion,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default("") String img,
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
    String? img,
    String? description,
    int? importantLevel,
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
      description: event.description,
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

  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case RepeatedFrequency.daily:
        return l10n.dailyText;
      case RepeatedFrequency.weekly:
        return l10n.weeklyText;
      case RepeatedFrequency.biweekly:
        return l10n.biweeklyText;
      case RepeatedFrequency.monthly:
        return l10n.monthlyText;
      case RepeatedFrequency.yearly:
        return l10n.yearlyText;
      case RepeatedFrequency.doesNotRepeat:
        return l10n.doesNotRepeatText;
    }
  }
}

RepeatedFrequency getRepeatedFrequencyJsonValue(String repeatedFrequencyAt) {
  try {
    return switch (repeatedFrequencyAt) {
      String s
          when s == RepeatedFrequency.daily.toRecurrenceRule().toString() =>
        RepeatedFrequency.daily,
      String s
          when s == RepeatedFrequency.weekly.toRecurrenceRule().toString() =>
        RepeatedFrequency.weekly,
      String s
          when s == RepeatedFrequency.biweekly.toRecurrenceRule().toString() =>
        RepeatedFrequency.biweekly,
      String s
          when s == RepeatedFrequency.monthly.toRecurrenceRule().toString() =>
        RepeatedFrequency.monthly,
      String s
          when s == RepeatedFrequency.yearly.toRecurrenceRule().toString() =>
        RepeatedFrequency.yearly,
      _ => RepeatedFrequency.doesNotRepeat
    };
  } catch (e) {
    return RepeatedFrequency.doesNotRepeat;
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
  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case RemindMeBeforeOptions.atTime:
        return l10n.atTimeOfEventText;
      case RemindMeBeforeOptions.tenMinutes:
        return l10n.tenMinutesText;
      case RemindMeBeforeOptions.thirtyMinutes:
        return l10n.thirtyMinutesText;
      case RemindMeBeforeOptions.oneHour:
        return l10n.oneHourText;
      case RemindMeBeforeOptions.oneDay:
        return l10n.oneDayText;
      case RemindMeBeforeOptions.threeDays:
        return l10n.threeDaysText;
      case RemindMeBeforeOptions.oneWeek:
        return l10n.oneWeekText;
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

RemindMeBeforeOptions getRemindMeBeforeOptionsJsonValue(double value) {
  switch (value) {
    case 0:
      return RemindMeBeforeOptions.atTime;
    case const (10 / 60):
      return RemindMeBeforeOptions.tenMinutes;
    case 0.5:
      return RemindMeBeforeOptions.thirtyMinutes;
    case 1:
      return RemindMeBeforeOptions.oneHour;
    case 24:
      return RemindMeBeforeOptions.oneDay;
    case const (24 * 3):
      return RemindMeBeforeOptions.threeDays;
    case const (24 * 7):
      return RemindMeBeforeOptions.oneWeek;
    default:
      return RemindMeBeforeOptions.atTime;
  }
}

extension ImportantLevelFunction on int {
  String? localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case 1:
        return l10n.calendarCategorySolarText;
      case 2:
        return l10n.calendarCategorySolarText;
      case 3:
        return l10n.calendarCategorySolarText;
      case 4:
        return l10n.calendarCategorySolarText;
      default:
        return l10n.calendarCategorySolarText;
    }
  }

  IconData? get icon {
    switch (this) {
      case 1:
        return Icons.family_restroom_sharp;
      case 2:
        return Icons.work_history_outlined;
      case 3:
        return Icons.perm_contact_cal_outlined;
      case 4:
        return Icons.messenger_outline_sharp;
    }
    return null;
  }

  String? get image {
    switch (this) {
      case 1:
        return AriesImages.defaultFamilyEvent;
      case 2:
        return AriesImages.defaultBusinessEvent;
      case 3:
        return AriesImages.defaultPersonalEvent;
      case 4:
        return AriesImages.defaultOtherEvent;
    }
    return null;
  }
}

enum CalendarCategory {
  @JsonValue('SOLAR')
  solar,
  @JsonValue('LUNAR')
  lunar,
}

extension CalendarCategoryExtension on CalendarCategory {
  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case CalendarCategory.solar:
        return l10n.calendarCategorySolarText;
      case CalendarCategory.lunar:
        return l10n.calendarCategoryLunarText;
    }
  }
}

enum EventCategory {
  @JsonValue('SPECIAL_EVENT')
  specialEvent,
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
  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case EventCategory.specialEvent:
        return l10n.eventCategorySpecialText;
      case EventCategory.religionEvent:
        return l10n.eventCategoryReligionText;
      case EventCategory.familyEvent:
        return l10n.eventCategoryFamilyText;
      case EventCategory.businessEvent:
        return l10n.eventCategoryBusinessText;
      case EventCategory.personalEvent:
        return l10n.eventCategoryPersonalText;
      case EventCategory.otherEvent:
        return l10n.eventCategoryOtherText;
    }
  }

  IconData? get icon {
    switch (this) {
      case EventCategory.specialEvent:
        return Icons.hub;
      case EventCategory.familyEvent:
        return Icons.family_restroom_sharp;
      case EventCategory.businessEvent:
        return Icons.work_history_outlined;
      case EventCategory.personalEvent:
        return Icons.perm_contact_cal_outlined;
      case EventCategory.otherEvent:
        return Icons.messenger_outline_sharp;
      case EventCategory.religionEvent:
        return null;
    }
  }

  String? get image {
    switch (this) {
      case EventCategory.familyEvent:
        return AriesImages.defaultFamilyEvent;
      case EventCategory.businessEvent:
        return AriesImages.defaultBusinessEvent;
      case EventCategory.personalEvent:
        return AriesImages.defaultPersonalEvent;
      case EventCategory.otherEvent:
        return AriesImages.defaultOtherEvent;
      case EventCategory.specialEvent:
        return AriesImages.defaultOtherEvent;
      case EventCategory.religionEvent:
        return null;
    }
  }
}
