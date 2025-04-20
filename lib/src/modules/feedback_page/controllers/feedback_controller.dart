import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'feedback_controller.g.dart';

@riverpod
class FeedbackController extends _$FeedbackController {
  @override
  FeedbackForm build() {
    return FeedbackForm(
      id: const Uuid().v4(),
      status: FeedbackResponseStatus.submitting,
      isExpanded: false,
      selectedSentiment: null,
      feedbackText: '',
      feedbackType: FeedbackType.featureRecommendation,
    );
  }

  void selectSentiment(FeelingRates sentiment) {
    state = state.copyWith(
      selectedSentiment: sentiment,
      isExpanded: true,
    );
  }

  void updateFeedbackText(String text) {
    state = state.copyWith(feedbackText: text);
  }

  void updateFeedbackType(FeedbackType type) {
    state = state.copyWith(feedbackType: type);
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded!);
  }

  void resetForm() {
    state = FeedbackForm(
      id: const Uuid().v4(),
      status: FeedbackResponseStatus.submitting,
      isExpanded: false,
      selectedSentiment: FeelingRates.neutral,
      feedbackText: '',
      feedbackType: FeedbackType.bugReport,
    );
  }

  bool isSubmitEnabled() {
    return state.feedbackText!.isNotEmpty && state.isExpanded!;
  }

  void submitFeedback() {
    resetForm();
  }
}
