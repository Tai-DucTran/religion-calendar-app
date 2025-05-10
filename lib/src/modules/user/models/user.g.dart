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
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      hasCompleteOnboarding: json['hasCompleteOnboarding'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
      profileImageUrl: json['profileImageUrl'] as String? ?? null,
      religionPreference: $enumDecodeNullable(
          _$ReligionPreferenceEnumMap, json['religionPreference']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'email': instance.email,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'hasCompleteOnboarding': instance.hasCompleteOnboarding,
      'isVerified': instance.isVerified,
      'profileImageUrl': instance.profileImageUrl,
      'religionPreference':
          _$ReligionPreferenceEnumMap[instance.religionPreference],
    };

const _$ReligionPreferenceEnumMap = {
  ReligionPreference.catholicism: 'CATHOLICISM',
  ReligionPreference.buddhism: 'BUDDHISM',
  ReligionPreference.unknown: 'UNKNOWN',
};
