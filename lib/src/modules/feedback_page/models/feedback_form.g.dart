// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackFormImpl _$$FeedbackFormImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackFormImpl(
      id: json['id'] as String,
      status: $enumDecode(_$FeedbackResponseStatusEnumMap, json['status']),
      isExpanded: json['isExpanded'] as bool,
      feedbackText: json['feedbackText'] as String,
      feedbackType: $enumDecode(_$FeedbackTypeEnumMap, json['feedbackType']),
      selectedSentiment:
          $enumDecodeNullable(_$FeelingRatesEnumMap, json['selectedSentiment']),
    );

Map<String, dynamic> _$$FeedbackFormImplToJson(_$FeedbackFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$FeedbackResponseStatusEnumMap[instance.status]!,
      'isExpanded': instance.isExpanded,
      'feedbackText': instance.feedbackText,
      'feedbackType': _$FeedbackTypeEnumMap[instance.feedbackType]!,
      'selectedSentiment': _$FeelingRatesEnumMap[instance.selectedSentiment],
    };

const _$FeedbackResponseStatusEnumMap = {
  FeedbackResponseStatus.submitting: 'SUBMITTING',
  FeedbackResponseStatus.pending: 'PENDING',
  FeedbackResponseStatus.responded: 'RESPONDED',
};

const _$FeedbackTypeEnumMap = {
  FeedbackType.bugReport: 'bugReport',
  FeedbackType.featureRecommendation: 'featureRecommendation',
};

const _$FeelingRatesEnumMap = {
  FeelingRates.hate: 'HATE',
  FeelingRates.dislike: 'DISLIKE',
  FeelingRates.neutral: 'NEUTRAL',
  FeelingRates.like: 'LIKE',
  FeelingRates.love: 'LOVE',
};
