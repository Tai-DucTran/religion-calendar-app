// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackConversationImpl _$$FeedbackConversationImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackConversationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userDisplayName: json['userDisplayName'] as String?,
      userEmail: json['userEmail'] as String?,
      status: $enumDecodeNullable(
              _$FeedbackResponseStatusEnumMap, json['status']) ??
          FeedbackResponseStatus.pending,
      feedbackTitle: json['feedbackTitle'] as String? ?? '',
      feedbackType:
          $enumDecodeNullable(_$FeedbackTypeEnumMap, json['feedbackType']) ??
              FeedbackType.featureRecommendation,
      selectedSentiment:
          $enumDecodeNullable(_$FeelingRatesEnumMap, json['selectedSentiment']),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => FeedbackMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FeedbackConversationImplToJson(
        _$FeedbackConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userDisplayName': instance.userDisplayName,
      'userEmail': instance.userEmail,
      'status': _$FeedbackResponseStatusEnumMap[instance.status],
      'feedbackTitle': instance.feedbackTitle,
      'feedbackType': _$FeedbackTypeEnumMap[instance.feedbackType],
      'selectedSentiment': _$FeelingRatesEnumMap[instance.selectedSentiment],
      'messages': instance.messages,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$FeedbackResponseStatusEnumMap = {
  FeedbackResponseStatus.pending: 'PENDING',
  FeedbackResponseStatus.responded: 'RESPONDED',
  FeedbackResponseStatus.closed: 'CLOSED',
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

_$FeedbackMessageImpl _$$FeedbackMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackMessageImpl(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String?,
      messageText: json['messageText'] as String? ?? '',
      isFromTeam: json['isFromTeam'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FeedbackMessageImplToJson(
        _$FeedbackMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'messageText': instance.messageText,
      'isFromTeam': instance.isFromTeam,
      'createdAt': instance.createdAt.toIso8601String(),
    };
