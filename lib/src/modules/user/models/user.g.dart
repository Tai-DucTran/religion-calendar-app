// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
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
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
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
