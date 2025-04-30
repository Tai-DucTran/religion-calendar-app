// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackFormSettingImpl _$$FeedbackFormSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackFormSettingImpl(
      isExpanded: json['isExpanded'] as bool? ?? false,
      feedback: FeedbackConversation.fromJson(
          json['feedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedbackFormSettingImplToJson(
        _$FeedbackFormSettingImpl instance) =>
    <String, dynamic>{
      'isExpanded': instance.isExpanded,
      'feedback': instance.feedback,
    };
