import 'dart:ui';

import 'package:aries/aries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "feedback_form.freezed.dart";
part "feedback_form.g.dart";

@freezed
class FeedbackForm with _$FeedbackForm {
  const factory FeedbackForm({
    required String id,
    required FeedbackResponseStatus status,
    required bool isExpanded,
    required String feedbackText,
    required FeedbackType feedbackType,
    FeelingRates? selectedSentiment,
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
  @JsonValue("SUBMITTING")
  submitting,
  @JsonValue("PENDING")
  pending,
  @JsonValue("RESPONDED")
  responded,
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
  bugReport,
  featureRecommendation,
}
