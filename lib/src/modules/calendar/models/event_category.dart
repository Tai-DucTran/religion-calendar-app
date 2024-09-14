import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

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
