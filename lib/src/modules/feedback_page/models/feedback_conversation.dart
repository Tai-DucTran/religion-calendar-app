import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

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

enum FeelingRates {
  @JsonValue("HATE")
  hate,
  @JsonValue("DISLIKE")
  dislike,
  @JsonValue("NEUTRAL")
  neutral,
  @JsonValue("LIKE")
  like,
  @JsonValue("LOVE")
  love,
}

enum FeedbackResponseStatus {
  @JsonValue("PENDING")
  pending,
  @JsonValue("RESPONDED")
  responded,
}

extension FeedbackResponseStatusExtension on FeedbackResponseStatus {
  Icon getIcon() {
    switch (this) {
      case FeedbackResponseStatus.pending:
        return Icon(
          Icons.pending_actions_rounded,
          color: AriesColor.neutral300,
        );
      case FeedbackResponseStatus.responded:
        return Icon(
          Icons.check,
          color: AriesColor.success600,
        );
    }
  }

  String getLocalized(BuildContext context) {
    switch (this) {
      case FeedbackResponseStatus.pending:
        return context.l10n.pendingText;
      case FeedbackResponseStatus.responded:
        return context.l10n.respondedText;
    }
  }
}

extension FeelingRatesExtension on FeelingRates {
  String getIconPath() {
    switch (this) {
      case FeelingRates.hate:
        return AriesIcons.faceFrownIcon;
      case FeelingRates.dislike:
        return AriesIcons.faceSadIcon;
      case FeelingRates.neutral:
        return AriesIcons.faceNeutralIcon;
      case FeelingRates.like:
        return AriesIcons.faceSmileIcon;
      case FeelingRates.love:
        return AriesIcons.faceHappyIcon;
    }
  }

  Color getColor() {
    switch (this) {
      case FeelingRates.hate:
        return AriesColor.danger300;
      case FeelingRates.dislike:
        return AriesColor.danger100;
      case FeelingRates.neutral:
        return AriesColor.yellowP400;
      case FeelingRates.like:
        return AriesColor.success300;
      case FeelingRates.love:
        return AriesColor.success400;
    }
  }
}

enum FeedbackType {
  @JsonValue("BUG_REPORT")
  bugReport,
  @JsonValue("FEATURE_RECOMMENDATION")
  featureRecommendation,
}

extension FeedbackTypeExtension on FeedbackType {
  String getLocalized(BuildContext context) {
    switch (this) {
      case FeedbackType.bugReport:
        return context.l10n.bugReportText;
      case FeedbackType.featureRecommendation:
        return context.l10n.featureRecommendationText;
    }
  }

  String getUserFeedbackTitleLocalized(BuildContext context) {
    switch (this) {
      case FeedbackType.bugReport:
        return context.l10n.reportDetailsTitleText;
      case FeedbackType.featureRecommendation:
        return context.l10n.feedbackDetailsTitleText;
    }
  }
}
