import 'package:religion_calendar_app/src/modules/feedback_page/models/feedback_conversation.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/feedback_conversation_repo.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "feedback_conversation_controller.g.dart";

// Provider for creating new conversations from feedback forms
@riverpod
class NewFeedbackConversationController
    extends _$NewFeedbackConversationController {
  @override
  FutureOr<String?> build() => null; // Initially null

  // Create a new feedback conversation
  Future<String?> createFeedbackConversation(
    FeedbackConversation feedback,
  ) async {
    state = const AsyncValue.loading();
    try {
      // Debug validation
      Log.dev("Creating feedback conversation");
      Log.dev("Messages count: ${feedback.messages.length}");

      // Validate the feedback object
      if (feedback.messages.isEmpty &&
          (feedback.feedbackTitle == null || feedback.feedbackTitle!.isEmpty)) {
        Log.error("Cannot create conversation: No content provided");
        state = const AsyncValue.data(null);
        return null;
      }

      // IMPORTANT: Create a validated copy of the feedback object
      final validatedFeedback = _createValidatedFeedback(feedback);

      // Debug: check the message structure
      for (final message in validatedFeedback.messages) {
        Log.dev("Message: ${message.messageText}, ID: ${message.id}");
      }

      final conversationId = await ref
          .read(feedbackConversationRepositoryProvider)
          .createFeedbackConversation(validatedFeedback);

      state = AsyncValue.data(conversationId);
      return conversationId;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      Log.error('Error creating conversation: $e');
      return null;
    }
  }

  // Helper method to create a clean, validated feedback object
  FeedbackConversation _createValidatedFeedback(FeedbackConversation feedback) {
    // Ensure we have valid messages
    final List<FeedbackMessage> validMessages = feedback.messages.isNotEmpty
        ? feedback.messages.map((message) {
            // Ensure each message has valid properties
            return FeedbackMessage(
              id: message.id,
              authorId: message.authorId,
              authorName: message.authorName,
              messageText: message.messageText ?? '',
              isFromTeam: message.isFromTeam,
              createdAt: message.createdAt,
            );
          }).toList()
        : [];

    // If no messages but we have a title, create a message from the title
    if (validMessages.isEmpty &&
        feedback.feedbackTitle != null &&
        feedback.feedbackTitle!.isNotEmpty) {
      // Create a default message from the feedback title
      validMessages.add(FeedbackMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        authorId: feedback.userId,
        authorName: feedback.userDisplayName,
        messageText: feedback.feedbackTitle,
        isFromTeam: false,
        createdAt: DateTime.now(),
      ));
    }

    // Create a cleaned, validated feedback object
    return FeedbackConversation(
      id: feedback.id,
      userId: feedback.userId,
      userDisplayName: feedback.userDisplayName,
      userEmail: feedback.userEmail,
      status: feedback.status,
      feedbackTitle: feedback.feedbackTitle ??
          (validMessages.isNotEmpty ? validMessages.first.messageText : ''),
      feedbackType: feedback.feedbackType,
      selectedSentiment: feedback.selectedSentiment,
      messages: validMessages, // Use the validated messages
      createdAt: feedback.createdAt,
      updatedAt: feedback.updatedAt,
    );
  }

  // Reset the state
  void reset() {
    state = const AsyncValue.data(null);
  }
}
