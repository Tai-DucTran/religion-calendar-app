// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEventImpl _$$UserEventImplFromJson(Map<String, dynamic> json) =>
    _$UserEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      calendarCategory:
          $enumDecode(_$CalendarCategoryEnumMap, json['calendarCategory']),
      eventCategory: $enumDecode(_$EventCategoryEnumMap, json['eventCategory']),
      isAllDay: json['isAllDay'] as bool? ?? false,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      remindMeBefore: (json['remindMeBefore'] as num).toDouble(),
      repeatedFrequencyAt: json['repeatedFrequencyAt'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$UserEventImplToJson(_$UserEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'calendarCategory': _$CalendarCategoryEnumMap[instance.calendarCategory]!,
      'eventCategory': _$EventCategoryEnumMap[instance.eventCategory]!,
      'isAllDay': instance.isAllDay,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'remindMeBefore': instance.remindMeBefore,
      'repeatedFrequencyAt': instance.repeatedFrequencyAt,
      'description': instance.description,
    };

const _$CalendarCategoryEnumMap = {
  CalendarCategory.solar: 'SOLAR',
  CalendarCategory.lunar: 'LUNAR',
};

const _$EventCategoryEnumMap = {
  EventCategory.religionEvent: 'RELIGION_EVENT',
  EventCategory.familyEvent: 'FAMILY_EVENT',
  EventCategory.businessEvent: 'BUSINESS_EVENT',
  EventCategory.personalEvent: 'PERSONAL_EVENT',
  EventCategory.otherEvent: 'OTHER_EVENT',
};

_$ReligionEventImpl _$$ReligionEventImplFromJson(Map<String, dynamic> json) =>
    _$ReligionEventImpl(
      id: json['id'] as String,
      localizedDescription: LocalizedDescription.fromJson(
          json['localizedDescription'] as Map<String, dynamic>),
      importantLevel:
          $enumDecode(_$ImportantLevelEnumMap, json['importantLevel']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      eventCategory: $enumDecode(_$EventCategoryEnumMap, json['eventCategory']),
      calendarCategory:
          $enumDecode(_$CalendarCategoryEnumMap, json['calendarCategory']),
      remindMeBefore: (json['remindMeBefore'] as num).toDouble(),
      religion: $enumDecode(_$ReligionPreferenceEnumMap, json['religion']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReligionEventImplToJson(_$ReligionEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localizedDescription': instance.localizedDescription,
      'importantLevel': _$ImportantLevelEnumMap[instance.importantLevel]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'eventCategory': _$EventCategoryEnumMap[instance.eventCategory]!,
      'calendarCategory': _$CalendarCategoryEnumMap[instance.calendarCategory]!,
      'remindMeBefore': instance.remindMeBefore,
      'religion': _$ReligionPreferenceEnumMap[instance.religion]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ImportantLevelEnumMap = {
  ImportantLevel.important: 'IMPORTANT',
  ImportantLevel.medium: 'MEDIUM',
  ImportantLevel.low: 'LOW',
};

const _$ReligionPreferenceEnumMap = {
  ReligionPreference.catholicism: 'CATHOLICISM',
  ReligionPreference.buddhism: 'BUDDHISM',
  ReligionPreference.unknown: 'UNKNOWN',
};

_$LocalizedDescriptionImpl _$$LocalizedDescriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizedDescriptionImpl(
      en: LocalizedContent.fromJson(json['en'] as Map<String, dynamic>),
      vi: LocalizedContent.fromJson(json['vi'] as Map<String, dynamic>),
      userEvent: json['userEvent'] == null
          ? null
          : LocalizedContent.fromJson(
              json['userEvent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocalizedDescriptionImplToJson(
        _$LocalizedDescriptionImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
      'vi': instance.vi,
      'userEvent': instance.userEvent,
    };

_$LocalizedContentImpl _$$LocalizedContentImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizedContentImpl(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$LocalizedContentImplToJson(
        _$LocalizedContentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

_$BasedEventImpl _$$BasedEventImplFromJson(Map<String, dynamic> json) =>
    _$BasedEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      calendarCategory:
          $enumDecode(_$CalendarCategoryEnumMap, json['calendarCategory']),
      eventCategory: $enumDecode(_$EventCategoryEnumMap, json['eventCategory']),
      isAllDay: json['isAllDay'] as bool? ?? false,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      remindMeBefore: (json['remindMeBefore'] as num).toDouble(),
      description: json['description'] as String?,
      importantLevel:
          $enumDecodeNullable(_$ImportantLevelEnumMap, json['importantLevel']),
      location: json['location'] as String?,
      repeatedFrequencyAt: json['repeatedFrequencyAt'] as String?,
    );

Map<String, dynamic> _$$BasedEventImplToJson(_$BasedEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'calendarCategory': _$CalendarCategoryEnumMap[instance.calendarCategory]!,
      'eventCategory': _$EventCategoryEnumMap[instance.eventCategory]!,
      'isAllDay': instance.isAllDay,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'remindMeBefore': instance.remindMeBefore,
      'description': instance.description,
      'importantLevel': _$ImportantLevelEnumMap[instance.importantLevel],
      'location': instance.location,
      'repeatedFrequencyAt': instance.repeatedFrequencyAt,
    };
