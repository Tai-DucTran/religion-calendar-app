import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_conversation_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "feedback_form_setting_controller.g.dart";

@Riverpod(keepAlive: true)
class FeedbackFormSettingController extends _$FeedbackFormSettingController {
  final defaultFeedbackForm = FeedbackConversation(
    id: '',
    userId: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  FeedbackFormSetting build() {
    final authRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authRepo.userId ?? '';
    final userName = authRepo.displayName;
    final userEmail = authRepo.email;

    // Initialize with user data from auth
    final initialFeedbackForm = FeedbackConversation(
      id: '',
      userId: userId,
      userDisplayName: userName,
      userEmail: userEmail,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return FeedbackFormSetting(
      feedback: initialFeedbackForm,
      isExpanded: false,
    );
  }

  void selectSentiment(FeelingRates sentiment) {
    state = state.copyWith(
      feedback: state.feedback.copyWith(
        selectedSentiment: sentiment,
      ),
    );
  }

  void updateFeedbackType(FeedbackType type) {
    state = state.copyWith(
      feedback: state.feedback.copyWith(
        feedbackType: type,
      ),
    );
  }

  void updateFeedbackText(String feedbackText) {
    final authRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authRepo.userId ?? '';
    final userName = authRepo.displayName;

    final message = FeedbackMessage(
      id: const Uuid().v4(),
      authorId: userId,
      authorName: userName,
      messageText: feedbackText,
      isFromTeam: false,
      createdAt: DateTime.now(),
    );

    final updatedMessages = [...state.feedback.messages, message];

    state = state.copyWith(
      feedback: state.feedback.copyWith(
        messages: updatedMessages,
        feedbackTitle: feedbackText.split('\n').first,
      ),
    );
  }

  void toggleExpanded(bool isExpanded) {
    state = state.copyWith(isExpanded: isExpanded);
  }

  bool isSubmitEnabled() {
    // Check if there's at least one message with content
    final hasContent = state.feedback.messages.isNotEmpty ||
        (state.feedback.feedbackTitle != null &&
            state.feedback.feedbackTitle!.isNotEmpty);

    return hasContent && state.isExpanded;
  }

  void resetForm() {
    final authRepo = ref.watch(authenticatorRepositoryProvider);
    final userId = authRepo.userId ?? '';
    final userName = authRepo.displayName;
    final userEmail = authRepo.email;

    // Create a completely new feedback conversation object
    final resetForm = FeedbackConversation(
      id: '',
      userId: userId,
      userDisplayName: userName,
      userEmail: userEmail,
      feedbackTitle: '',
      messages: [],
      feedbackType: FeedbackType.featureRecommendation,
      status: FeedbackResponseStatus.pending,
      selectedSentiment: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Log that we're resetting the form
    Log.dev('Resetting feedback form');

    // Update the state with the reset form and collapse the form
    state = FeedbackFormSetting(
      isExpanded: false,
      feedback: resetForm,
    );
  }

  Future<String?> submitFeedback() async {
    Log.dev(
        'Submitting feedback with ${state.feedback.messages.length} messages');

    // Don't modify state during async operation
    final FeedbackConversation feedbackToSubmit = state.feedback.copyWith();

    // Check if we have content to submit
    if (feedbackToSubmit.feedbackTitle == null ||
        feedbackToSubmit.feedbackTitle!.isEmpty) {
      Log.error('Cannot submit feedback: No content');
      return null;
    }

    try {
      // Create a proper message from the feedback title if none exists
      FeedbackConversation conversationToSubmit = feedbackToSubmit;

      // If no messages, create one from the title
      if (feedbackToSubmit.messages.isEmpty &&
          feedbackToSubmit.feedbackTitle != null) {
        final authRepo = ref.read(authenticatorRepositoryProvider);
        final userId = authRepo.userId ?? '';
        final userName = authRepo.displayName;

        // Create a single message with the feedback title as content
        final newMessage = FeedbackMessage(
          id: const Uuid().v4(),
          authorId: userId,
          authorName: userName,
          messageText: feedbackToSubmit.feedbackTitle,
          isFromTeam: false,
          createdAt: DateTime.now(),
        );

        // Update the conversation with this message
        conversationToSubmit = feedbackToSubmit.copyWith(
          messages: [newMessage],
        );
      }

      // Create the conversation with the properly prepared data
      final controller =
          ref.read(newFeedbackConversationControllerProvider.notifier);
      final String? conversationId =
          await controller.createFeedbackConversation(conversationToSubmit);

      if (conversationId != null) {
        Log.info('Feedback submitted successfully with ID: $conversationId');

        // Only reset the form after successful submission
        resetForm();

        return conversationId;
      } else {
        Log.error('Failed to get conversation ID');
        return null;
      }
    } catch (e) {
      Log.error('Failed to submit feedback: $e', error: e);
      return null;
    }
  }

  void updateFeedbackImage(String? imageUrl) {
    state = state.copyWith(
      feedback: state.feedback.copyWith(
        feedbackImageUrl: imageUrl,
      ),
    );
  }
}
