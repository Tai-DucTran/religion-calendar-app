import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

part "feedback_form.freezed.dart";
part "feedback_form.g.dart";

@freezed
class FeedbackForm with _$FeedbackForm {
  const factory FeedbackForm({
    required String id,
    @Default(FeedbackResponseStatus.pending) FeedbackResponseStatus? status,
    @Default('') String? feedbackText,
    @Default(FeedbackType.featureRecommendation) FeedbackType? feedbackType,
    @Default('') String? feedbackResponse,
    FeelingRates? selectedSentiment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FeedbackForm;

  factory FeedbackForm.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFormFromJson(json);

  const FeedbackForm._();
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
          color: AriesColor.success400,
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
