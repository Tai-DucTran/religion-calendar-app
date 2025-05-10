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

  // Create a new feedback conversation - completely rewritten
  Future<String?> createFeedbackConversation(
    FeedbackConversation feedback,
  ) async {
    // Important: Don't use state.whenData here as it can cause the Future already completed error

    try {
      // Validate the feedback
      if (feedback.messages.isEmpty &&
          (feedback.feedbackTitle == null || feedback.feedbackTitle!.isEmpty)) {
        Log.error("Cannot create conversation: No content provided");
        return null;
      }

      // Create a validated copy of the feedback
      final validatedFeedback = _createValidatedFeedback(feedback);

      // Get the repository instance
      final repository = ref.read(feedbackConversationRepositoryProvider);

      // Create the conversation directly without updating state during the operation
      final conversationId =
          await repository.createFeedbackConversation(validatedFeedback);

      // Only after completion, update the state
      state = AsyncData(conversationId);

      return conversationId;
    } catch (e) {
      Log.error('Error creating conversation: $e');

      // Update state with error but don't rethrow
      state = AsyncError(e, StackTrace.current);

      return null;
    }
  }

  FeedbackConversation _createValidatedFeedback(FeedbackConversation feedback) {
    final List<FeedbackMessage> validMessages = feedback.messages.isNotEmpty
        ? feedback.messages.map((message) {
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

    if (validMessages.isEmpty &&
        feedback.feedbackTitle != null &&
        feedback.feedbackTitle!.isNotEmpty) {
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
      feedbackImageUrl: feedback.feedbackImageUrl,
      messages: validMessages,
      createdAt: feedback.createdAt,
      updatedAt: feedback.updatedAt,
    );
  }

  // Reset the state
  void reset() {
    state = const AsyncData(null);
  }
}
