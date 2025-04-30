import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';

part "feedback_conversation.freezed.dart";
part "feedback_conversation.g.dart";

@freezed
class FeedbackConversation with _$FeedbackConversation {
  const factory FeedbackConversation({
    required String id,
    required String userId,
    String? userDisplayName,
    String? userEmail,
    @Default(FeedbackResponseStatus.pending) FeedbackResponseStatus? status,
    @Default('') String? feedbackTitle,
    @Default(FeedbackType.featureRecommendation) FeedbackType? feedbackType,
    FeelingRates? selectedSentiment,
    @Default([]) List<FeedbackMessage> messages,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FeedbackConversation;

  factory FeedbackConversation.fromJson(Map<String, dynamic> json) =>
      _$FeedbackConversationFromJson(json);

  const FeedbackConversation._();
}

@freezed
class FeedbackMessage with _$FeedbackMessage {
  const factory FeedbackMessage({
    required String id,
    required String authorId,
    String? authorName,
    @Default('') String? messageText,
    @Default(false) bool isFromTeam,
    required DateTime createdAt,
  }) = _FeedbackMessage;

  factory FeedbackMessage.fromJson(Map<String, dynamic> json) =>
      _$FeedbackMessageFromJson(json);

  const FeedbackMessage._();
}
