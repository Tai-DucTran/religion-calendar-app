// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_date_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDateTimeImpl _$$EventDateTimeImplFromJson(Map<String, dynamic> json) =>
    _$EventDateTimeImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$EventDateTimeImplToJson(_$EventDateTimeImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
