import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/feedback/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback/models/models.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

/// A form that prompts the user for the type of feedback they want to give,
/// free form text feedback, and a sentiment rating.
/// The submit button is disabled until the user provides the feedback type. All
/// other fields are optional.

class CustomFeedbackForm extends ConsumerStatefulWidget {
  const CustomFeedbackForm({
    super.key,
    required this.onSubmit,
    required this.scrollController,
  });

  final OnSubmit onSubmit;
  final ScrollController? scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomFeedbackFormState();
}

class _CustomFeedbackFormState extends ConsumerState<CustomFeedbackForm> {
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
          onPressed: _customFeedback.feedbackType != null
              ? () {
                  widget.onSubmit(
                    _customFeedback.feedbackText ?? '',
                    extras: _customFeedback.toMap(),
                  );

                  // Hide the feedback form after submission
                  ref
                      .read(feedbackControllerProvider.notifier)
                      .hideFeedbackForm();
                }
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
