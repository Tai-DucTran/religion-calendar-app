import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

/// A data type holding user feedback consisting of a feedback type, free from
/// feedback text, and a sentiment rating.
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

/// A form that prompts the user for the type of feedback they want to give,
/// free form text feedback, and a sentiment rating.
/// The submit button is disabled until the user provides the feedback type. All
/// other fields are optional.
class CustomFeedbackForm extends StatefulWidget {
  const CustomFeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  State<CustomFeedbackForm> createState() => _CustomFeedbackFormState();
}

class _CustomFeedbackFormState extends State<CustomFeedbackForm> {
  final CustomFeedback _customFeedback = CustomFeedback();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              if (widget.scrollController != null)
                const FeedbackSheetDragHandle(),
              ListView(
                controller: widget.scrollController,
                padding: EdgeInsets.fromLTRB(
                  16,
                  widget.scrollController != null ? 20 : 16,
                  16,
                  0,
                ),
                children: [
                  Text(context.l10n.whatKindOfFeedbackTitleText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DropdownButton<FeedbackType>(
                          value: _customFeedback.feedbackType,
                          items: FeedbackType.values
                              .map(
                                (type) => DropdownMenuItem<FeedbackType>(
                                  value: type,
                                  child: Text(
                                    type.getLocalized(context),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (feedbackType) => setState(() =>
                              _customFeedback.feedbackType = feedbackType),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              FeedbackRating.values.map(_ratingToIcon).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(context.l10n.whatIsYourFeedbackTitleText),
                  TextField(
                    cursorColor: AriesColor.neutral60,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 4.h,
                      ),
                      isDense: true,
                      hintStyle: AriesTextStyles.textHintTextField,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AriesColor.neutral40),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AriesColor.neutral50,
                          width: 2,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AriesColor.neutral40,
                        ),
                      ),
                    ),
                    onChanged: (newFeedback) =>
                        _customFeedback.feedbackText = newFeedback,
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
          // disable this button until the user has specified a feedback type
          onPressed: _customFeedback.feedbackType != null
              ? () => widget.onSubmit(
                    _customFeedback.feedbackText ?? '',
                    extras: _customFeedback.toMap(),
                  )
              : null,
          child: Text(
            context.l10n.submitButtonText,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _ratingToIcon(FeedbackRating rating) {
    final bool isSelected = _customFeedback.rating == rating;
    late IconData icon;
    late Color color;
    switch (rating) {
      case FeedbackRating.bad:
        icon = Icons.sentiment_dissatisfied;
        color = AriesColor.danger300;
        break;
      case FeedbackRating.neutral:
        icon = Icons.sentiment_neutral;
        color = AriesColor.yellowP300;
        break;
      case FeedbackRating.good:
        icon = Icons.sentiment_satisfied;
        color = AriesColor.success500;
        break;
    }

    return IconButton(
      color: isSelected ? color : Colors.grey,
      onPressed: () => setState(
        () => _customFeedback.rating = rating,
      ),
      icon: Icon(icon),
      iconSize: 36,
    );
  }
}
