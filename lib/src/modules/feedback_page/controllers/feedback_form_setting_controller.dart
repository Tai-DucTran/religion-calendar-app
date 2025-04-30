import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_conversation_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "feedback_form_setting_controller.g.dart";

@Riverpod(keepAlive: true)
@riverpod
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

    // Create a new list with the existing messages plus the new one
    final updatedMessages = [...state.feedback.messages, message];

    // Debug: Check what we're adding
    Log.dev('Adding message to feedback: ${message.messageText}');
    Log.dev('Updated messages count: ${updatedMessages.length}');

    state = state.copyWith(
      feedback: state.feedback.copyWith(
        messages: updatedMessages,
        // Also update the feedbackTitle to use the first part of the message
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

    // Log the state after reset to verify
    Log.dev(
        'Form reset complete. Message count: ${state.feedback.messages.length}');
  }

  Future<String?> submitFeedback() async {
    try {
      // Debug: Log the feedback we're submitting
      Log.dev(
          'Submitting feedback with ${state.feedback.messages.length} messages');

      // Validate data before submitting
      if (state.feedback.messages.isEmpty) {
        Log.warn('No messages in feedback to submit');

        // If we have a title but no messages, create a message from the title
        if (state.feedback.feedbackTitle != null &&
            state.feedback.feedbackTitle!.isNotEmpty) {
          Log.dev('Creating a message from feedback title');
          updateFeedbackText(state.feedback.feedbackTitle!);
        } else {
          Log.error('Cannot submit feedback: No content');
          return null;
        }
      }

      // Debugging: Check message structure
      for (var i = 0; i < state.feedback.messages.length; i++) {
        final message = state.feedback.messages[i];
        Log.dev('Message $i: ${message.messageText}, ID: ${message.id}');
      }

      // Use the new conversation controller to create a feedback conversation
      final conversationController =
          ref.read(newFeedbackConversationControllerProvider.notifier);

      // FIX: Store the result in a local variable
      final String? conversationId =
          await conversationController.createFeedbackConversation(
        state.feedback,
      );

      if (conversationId != null) {
        Log.info(
            'Feedback submitted successfully with conversation ID: $conversationId');

        // FIX: Move the reset AFTER we check the result and BEFORE we return
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
}
