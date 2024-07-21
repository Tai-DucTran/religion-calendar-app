// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoPayLoadImpl _$$UserInfoPayLoadImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoPayLoadImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      religionReference: $enumDecodeNullable(
          _$ReligionPreferenceEnumMap, json['religionReference']),
    );

Map<String, dynamic> _$$UserInfoPayLoadImplToJson(
        _$UserInfoPayLoadImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'religionReference':
          _$ReligionPreferenceEnumMap[instance.religionReference],
    };

const _$ReligionPreferenceEnumMap = {
  ReligionPreference.catholicism: 'CATHOLICISM',
  ReligionPreference.buddhism: 'BUDDHISM',
  ReligionPreference.unknown: 'UNKNOWN',
};
