import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class CustomFeedback {
  CustomFeedback({
    this.feedbackType,
    this.feedbackText,
    this.rating,
  });

  FeedbackType? feedbackType;
  String? feedbackText;
  FeedbackRating? rating;

  @override
  String toString() {
    return {
      if (rating != null) 'rating': rating.toString(),
      'feedback_type': feedbackType.toString(),
      'feedback_text': feedbackText,
    }.toString();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (rating != null) 'rating': rating.toString(),
      'feedback_type': feedbackType.toString(),
      'feedback_text': feedbackText,
    };
  }
}

/// What type of feedback the user wants to provide.
enum FeedbackType {
  bugReport,
  featureRequest,
}

extension FeedbackTypeExtension on FeedbackType {
  String getLocalized(BuildContext context) {
    switch (this) {
      case FeedbackType.bugReport:
        return context.l10n.bugReportText;
      case FeedbackType.featureRequest:
        return context.l10n.featureRequestText;
    }
  }
}

/// A user-provided sentiment rating.
enum FeedbackRating {
  bad,
  neutral,
  good,
}

extension FeedbackRatingExtension on FeedbackRating {
  String getLocalized(BuildContext context) {
    switch (this) {
      case FeedbackRating.bad:
        return context.l10n.feelBad;
      case FeedbackRating.neutral:
        return context.l10n.feelNeutral;
      case FeedbackRating.good:
        return context.l10n.feelGood;
    }
  }
}
