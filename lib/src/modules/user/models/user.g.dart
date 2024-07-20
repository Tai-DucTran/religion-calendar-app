// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      religionReference:
          $enumDecodeNullable(_$ReligionEnumMap, json['religionReference']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'religionReference': _$ReligionEnumMap[instance.religionReference],
    };

const _$ReligionEnumMap = {
  Religion.catholicism: 'CATHOLICISM',
  Religion.buddhism: 'BUDDHISM',
  Religion.unknown: 'UNKNOWN',
};
