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

  // Create a new feedback conversation - completely rewritten to avoid Future completion issues
  Future<String> createFeedbackConversation(
    FeedbackConversation initialFeedback,
  ) async {
    try {
      // Create a new document in the root collection
      final feedbackDocRef = firestoreFeedbackRef.doc();
      final feedbackId = feedbackDocRef.id;

      // Update the feedback with the generated ID and timestamps
      final now = DateTime.now();
      final conversation = initialFeedback.copyWith(
        id: feedbackId,
        createdAt: now,
        updatedAt: now,
      );

      // Create a simple map that won't have serialization issues
      final Map<String, dynamic> conversationData = {
        'id': conversation.id,
        'userId': conversation.userId,
        'userDisplayName': conversation.userDisplayName,
        'userEmail': conversation.userEmail,
        'status':
            conversation.status?.toString().split('.').last.toUpperCase() ??
                'PENDING',
        'feedbackTitle': conversation.feedbackTitle ?? '',
        'feedbackType': conversation.feedbackType
                ?.toString()
                .split('.')
                .last
                .toUpperCase() ??
            'FEATURE_RECOMMENDATION',
        'selectedSentiment': conversation.selectedSentiment
            ?.toString()
            .split('.')
            .last
            .toUpperCase(),
        'createdAt': conversation.createdAt.toIso8601String(),
        'updatedAt': conversation.updatedAt.toIso8601String(),
        'messages': conversation.messages
            .map((m) => {
                  'id': m.id,
                  'authorId': m.authorId,
                  'authorName': m.authorName ?? '',
                  'messageText': m.messageText ?? '',
                  'isFromTeam': m.isFromTeam,
                  'createdAt': m.createdAt.toIso8601String(),
                })
            .toList(),
      };

      // Save to Firestore - handle this in a single operation
      await feedbackDocRef.set(conversationData);

      // Add a reference in the user's subcollection if user is authenticated
      if (_currentUserId != null) {
        // Create a separate transaction for the user reference
        await firestoreUserRef
            .doc(_currentUserId)
            .collection(FirebaseCollectionName.feedbackForms)
            .doc(feedbackId)
            .set({
          'referenceId': feedbackId,
          'createdAt': now.toIso8601String(),
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

      // Create a new message as a simple map
      final messageId = const Uuid().v4();
      final now = DateTime.now();
      final newMessage = {
        'id': messageId,
        'authorId': _currentUserId!,
        'authorName': _currentUserDisplayName,
        'messageText': messageText,
        'isFromTeam': false,
        'createdAt': now.toIso8601String(),
      };

      // Get a reference to the conversation document
      final conversationRef = firestoreFeedbackRef.doc(conversationId);

      // Update the document directly without using a transaction
      final doc = await conversationRef.get();
      if (!doc.exists) {
        throw Exception('Feedback conversation not found');
      }

      final data = doc.data()!;
      final List<dynamic> currentMessages = data['messages'] ?? [];
      final updatedMessages = [...currentMessages, newMessage];

      await conversationRef.update({
        'messages': updatedMessages,
        'updatedAt': now.toIso8601String(),
        // If the status was 'responded', change it back to 'pending'
        if (data['status'] == 'RESPONDED') 'status': 'PENDING',
      });

      Log.info('Message added to conversation: $conversationId');
    } catch (e) {
      Log.error('Failed to add message to conversation: $e');
      throw Exception('Failed to add message: $e');
    }
  }
}
