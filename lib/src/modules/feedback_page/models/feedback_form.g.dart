// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackFormImpl _$$FeedbackFormImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackFormImpl(
      id: json['id'] as String,
      status: $enumDecodeNullable(
              _$FeedbackResponseStatusEnumMap, json['status']) ??
          FeedbackResponseStatus.pending,
      feedbackText: json['feedbackText'] as String? ?? '',
      feedbackType:
          $enumDecodeNullable(_$FeedbackTypeEnumMap, json['feedbackType']) ??
              FeedbackType.featureRecommendation,
      selectedSentiment:
          $enumDecodeNullable(_$FeelingRatesEnumMap, json['selectedSentiment']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FeedbackFormImplToJson(_$FeedbackFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$FeedbackResponseStatusEnumMap[instance.status],
      'feedbackText': instance.feedbackText,
      'feedbackType': _$FeedbackTypeEnumMap[instance.feedbackType],
      'selectedSentiment': _$FeelingRatesEnumMap[instance.selectedSentiment],
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$FeedbackResponseStatusEnumMap = {
  FeedbackResponseStatus.submitting: 'SUBMITTING',
  FeedbackResponseStatus.pending: 'PENDING',
  FeedbackResponseStatus.responded: 'RESPONDED',
};

const _$FeedbackTypeEnumMap = {
  FeedbackType.bugReport: 'BUG_REPORT',
  FeedbackType.featureRecommendation: 'FEATURE_RECOMMENDATION',
};

const _$FeelingRatesEnumMap = {
  FeelingRates.hate: 'HATE',
  FeelingRates.dislike: 'DISLIKE',
  FeelingRates.neutral: 'NEUTRAL',
  FeelingRates.like: 'LIKE',
  FeelingRates.love: 'LOVE',
};
