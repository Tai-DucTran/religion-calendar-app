// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      result: $enumDecodeNullable(_$AuthResultsEnumMap, json['result']),
      isLoading: json['isLoading'] as bool,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'result': _$AuthResultsEnumMap[instance.result],
      'isLoading': instance.isLoading,
      'user': instance.user,
    };

const _$AuthResultsEnumMap = {
  AuthResults.aborted: 'aborted',
  AuthResults.success: 'success',
  AuthResults.failure: 'failure',
};
