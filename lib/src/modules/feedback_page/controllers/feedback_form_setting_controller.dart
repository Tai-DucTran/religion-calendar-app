import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/repositories.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "feedback_form_setting_controller.g.dart";

@riverpod
class FeedbackFormSettingController extends _$FeedbackFormSettingController {
  final defaultFeedbackForm = FeedbackForm(
    id: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  FeedbackFormSetting build() {
    return FeedbackFormSetting(
      feedbackForm: defaultFeedbackForm,
      isExpanded: false,
    );
  }

  void selectSentiment(FeelingRates sentiment) {
    state = state.copyWith(
      feedbackForm: state.feedbackForm.copyWith(
        selectedSentiment: sentiment,
      ),
    );
  }

  void updateFeedbackType(FeedbackType type) {
    state = state.copyWith(
      feedbackForm: state.feedbackForm.copyWith(
        feedbackType: type,
      ),
    );
  }

  void updateFeedbackText(String feedbackText) {
    state = state.copyWith(
      feedbackForm: state.feedbackForm.copyWith(
        feedbackText: feedbackText,
      ),
    );
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  bool isSubmitEnabled() {
    return state.feedbackForm.feedbackText!.isNotEmpty && state.isExpanded;
  }

  void resetForm() {
    state =
        state.copyWith(isExpanded: false, feedbackForm: defaultFeedbackForm);
  }

  Future<void> submitFeedback({
    required FeedbackForm feedbackForm,
  }) async {
    try {
      final repository = ref.read(feedbackFormRepositoryProvider);

      await repository.createFeedbackForm(
        feedbackForm,
      );

      Log.info('Feedback submitted successfully');
      resetForm();
    } catch (e) {
      Log.error('Failed to submit feedback: $e');
    }
  }
}
