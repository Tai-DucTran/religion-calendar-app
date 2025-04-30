import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/repositories.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "feedback_form_setting_controller.g.dart";

@Riverpod(keepAlive: true)
@riverpod
class FeedbackFormSettingController extends _$FeedbackFormSettingController {
  final defaultFeedbackForm = FeedbackForm(
    id: '',
    userId: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  FeedbackFormSetting build() {
    final authRepo = ref.watch(authenticatorRepositoryProvider);

    // Initialize with user data from auth
    final initialFeedbackForm = FeedbackForm(
      id: '',
      userId: authRepo.userId ?? '',
      userDisplayName: authRepo.displayName,
      userEmail: authRepo.email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return FeedbackFormSetting(
      feedbackForm: initialFeedbackForm,
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

  void toggleExpanded(bool isExpanded) {
    state = state.copyWith(isExpanded: isExpanded);
  }

  bool isSubmitEnabled() {
    return state.feedbackForm.feedbackText!.isNotEmpty && state.isExpanded;
  }

  void resetForm() {
    final authRepo = ref.watch(authenticatorRepositoryProvider);

    final resetForm = FeedbackForm(
      id: '',
      userId: authRepo.userId ?? '',
      userDisplayName: authRepo.displayName,
      userEmail: authRepo.email,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    state = state.copyWith(
      isExpanded: false,
      feedbackForm: resetForm,
    );
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
