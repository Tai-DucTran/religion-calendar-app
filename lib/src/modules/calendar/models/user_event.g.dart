// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEventImpl _$$UserEventImplFromJson(Map<String, dynamic> json) =>
    _$UserEventImpl(
      userId: json['userId'] as String,
      eventId: json['eventId'] as String,
      eventName: json['eventName'] as String,
      eventCategory: $enumDecode(_$EventCategoryEnumMap, json['eventCategory']),
      isAllDay: json['isAllDay'] as bool,
      startingDate: DateTime.parse(json['startingDate'] as String),
      endingDate: DateTime.parse(json['endingDate'] as String),
      location: json['location'] as String,
      remindMeBefore: (json['remindMeBefore'] as num).toDouble(),
      repeatFrequencyAt:
          $enumDecode(_$RepeatFrequencyEnumMap, json['repeatFrequencyAt']),
    );

Map<String, dynamic> _$$UserEventImplToJson(_$UserEventImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'eventCategory': _$EventCategoryEnumMap[instance.eventCategory]!,
      'isAllDay': instance.isAllDay,
      'startingDate': instance.startingDate.toIso8601String(),
      'endingDate': instance.endingDate.toIso8601String(),
      'location': instance.location,
      'remindMeBefore': instance.remindMeBefore,
      'repeatFrequencyAt':
          _$RepeatFrequencyEnumMap[instance.repeatFrequencyAt]!,
    };

const _$EventCategoryEnumMap = {
  EventCategory.religionEvent: 'RELIGION',
  EventCategory.familyEvent: 'FAMILY_EVENT',
  EventCategory.businessEvent: 'BUSINESS_EVENT',
  EventCategory.personalEvent: 'PERSONAL_EVENT',
  EventCategory.otherEvent: 'OTHER_EVENT',
};

const _$RepeatFrequencyEnumMap = {
  RepeatFrequency.daily: 'DAILY',
  RepeatFrequency.weekly: 'WEEKLY',
  RepeatFrequency.biweekly: 'BIWEEKLY',
  RepeatFrequency.monthly: 'MONTHLY',
  RepeatFrequency.yearly: 'YEARLY',
  RepeatFrequency.doesNotRepeat: 'DOES_NOT_REPEAT',
};
