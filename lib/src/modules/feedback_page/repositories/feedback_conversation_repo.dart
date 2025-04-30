import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/feedback_conversation.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "feedback_conversation_repo.g.dart";

@riverpod
FeedbackConversationRepository feedbackConversationRepository(Ref ref) {
  return FeedbackConversationRepository(ref);
}

class FeedbackConversationRepository {
  final Ref _ref;
  FeedbackConversationRepository(this._ref);

  // Root level collection for feedback conversations
  final firestoreFeedbackRef = FirebaseFirestore.instance.collection(
    'feedbackConversations',
  );

  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  String? get _currentUserId =>
      _ref.read(authenticatorRepositoryProvider).userId;

  String? get _currentUserDisplayName =>
      _ref.read(authenticatorRepositoryProvider).displayName;

  // Create a new feedback conversation
  // Create a new feedback conversation
  Future<String> createFeedbackConversation(
    FeedbackConversation initialFeedback,
  ) async {
    try {
      // Create a new document in the root collection
      final feedbackDocRef = firestoreFeedbackRef.doc();
      final feedbackId = feedbackDocRef.id;

      // Update the feedback with the generated ID
      final conversation = initialFeedback.copyWith(
        id: feedbackId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // THIS IS THE KEY FIX: Convert messages to JSON manually to ensure proper serialization
      final Map<String, dynamic> conversationData = conversation.toJson();

      // Convert messages array to JSON explicitly
      final List<Map<String, dynamic>> messagesJson =
          conversation.messages.map((message) => message.toJson()).toList();

      // Replace the messages with the JSON list
      conversationData['messages'] = messagesJson;

      Log.dev('Saving conversation data: $conversationData');

      // Save the properly serialized map to Firestore
      await feedbackDocRef.set(conversationData);

      // Also add a reference in the user's subcollection
      if (_currentUserId != null) {
        await firestoreUserRef
            .doc(_currentUserId)
            .collection(FirebaseCollectionName.feedbackForms)
            .doc(feedbackId)
            .set({
          'referenceId': feedbackId,
          'createdAt': DateTime.now().toIso8601String()
        });
      }

      Log.info(
          'Feedback conversation created successfully with ID: $feedbackId');
      return feedbackId;
    } catch (e) {
      Log.error('Failed to create feedback conversation: $e');
      throw Exception('Failed to create feedback conversation: $e');
    }
  }

  // Add a new message to a conversation
  Future<void> addMessageToConversation(
    String conversationId,
    String messageText,
  ) async {
    try {
      if (_currentUserId == null) {
        throw Exception('User ID is not available');
      }

      final newMessage = FeedbackMessage(
        id: const Uuid().v4(),
        authorId: _currentUserId!,
        authorName: _currentUserDisplayName,
        messageText: messageText,
        isFromTeam: false,
        createdAt: DateTime.now(),
      );

      // Get a reference to the conversation
      final conversationRef = firestoreFeedbackRef.doc(conversationId);

      // Convert message to JSON manually to avoid serialization issues
      final newMessageMap = newMessage.toJson();

      // Add the new message to the messages array
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(conversationRef);

        if (!snapshot.exists) {
          throw Exception('Feedback conversation not found');
        }

        final data = snapshot.data()!;

        // Get current messages as List<dynamic>
        final List<dynamic> currentMessages = data['messages'] ?? [];

        // Add the new message as a Map
        final updatedMessages = [...currentMessages, newMessageMap];

        transaction.update(conversationRef, {
          'messages': updatedMessages,
          'updatedAt': DateTime.now().toIso8601String(),
          // If the status was 'responded', change it back to 'pending'
          if (data['status'] == 'RESPONDED') 'status': 'PENDING',
        });
      });

      Log.info('Message added to conversation: $conversationId');
    } catch (e) {
      Log.error('Failed to add message to conversation: $e');
      throw Exception('Failed to add message: $e');
    }
  }
}
