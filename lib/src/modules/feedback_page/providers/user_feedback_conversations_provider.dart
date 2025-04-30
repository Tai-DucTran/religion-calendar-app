import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_feedback_conversations_provider.g.dart';

@riverpod
class UserFeedbackConversationsProvider
    extends _$UserFeedbackConversationsProvider {
  @override
  FutureOr<List<FeedbackConversation>> build({
    int limit = 20,
    bool includeAllMessages = true,
    int maxMessages = 10,
  }) async {
    return _fetchFeedbackConversations(
      limit: limit,
      includeAllMessages: includeAllMessages,
      maxMessages: maxMessages,
    );
  }

  Future<List<FeedbackConversation>> _fetchFeedbackConversations({
    required int limit,
    required bool includeAllMessages,
    required int maxMessages,
  }) async {
    final repository = ref.read(feedbackConversationRepositoryProvider);

    return await repository.getUserFeedbackConversations(
      limit: limit,
      includeAllMessages: includeAllMessages,
      maxMessages: maxMessages,
    );
  }

  // Method to manually refresh the conversations list
  Future<void> refresh() async {
    state = const AsyncValue.loading();

    try {
      final conversations = await _fetchFeedbackConversations(
        limit: limit,
        includeAllMessages: includeAllMessages,
        maxMessages: maxMessages,
      );

      state = AsyncValue.data(conversations);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // Add a new message to a conversation
  Future<void> addMessageToConversation(
      String conversationId, String messageText) async {
    try {
      final repository = ref.read(feedbackConversationRepositoryProvider);

      // Add the message
      await repository.addMessageToConversation(conversationId, messageText);

      // Refresh the conversations to show the update
      await refresh();
    } catch (e) {
      // If there's an error, update the state to show the error
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}
