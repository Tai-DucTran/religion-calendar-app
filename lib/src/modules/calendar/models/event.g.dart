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
      title: json['title'] as String,
      religion: $enumDecode(_$ReligionPreferenceEnumMap, json['religion']),
      eventCategory:
          $enumDecodeNullable(_$EventCategoryEnumMap, json['eventCategory']) ??
              EventCategory.religionEvent,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      remindMeBefore: (json['remindMeBefore'] as num).toDouble(),
      description: json['description'] as String,
      level: $enumDecode(_$ImportantLevelEnumMap, json['level']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ReligionEventImplToJson(_$ReligionEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'religion': _$ReligionPreferenceEnumMap[instance.religion]!,
      'eventCategory': _$EventCategoryEnumMap[instance.eventCategory]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'remindMeBefore': instance.remindMeBefore,
      'description': instance.description,
      'level': _$ImportantLevelEnumMap[instance.level]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ReligionPreferenceEnumMap = {
  ReligionPreference.catholicism: 'CATHOLICISM',
  ReligionPreference.buddhism: 'BUDDHISM',
  ReligionPreference.unknown: 'UNKNOWN',
};

const _$ImportantLevelEnumMap = {
  ImportantLevel.important: 'IMPORTANT',
  ImportantLevel.medium: 'MEDIUM',
  ImportantLevel.low: 'LOW',
};
