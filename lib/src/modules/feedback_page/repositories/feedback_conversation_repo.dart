import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "feedback_conversation_repo.g.dart";

@riverpod
class FeedbackConversationStream extends _$FeedbackConversationStream {
  @override
  Stream<FeedbackConversation?> build(String conversationId) {
    if (conversationId.isEmpty) {
      return Stream.value(null);
    }

    return FirebaseFirestore.instance
        .collection('feedbackConversations')
        .doc(conversationId)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) {
        Log.error('Conversation document does not exist');
        return null;
      }

      try {
        // Log the raw data for debugging
        final data = snapshot.data()!;
        return FeedbackConversation.fromJson(data);
      } catch (e, stackTrace) {
        Log.error('Error parsing feedback conversation: $e',
            error: e, stackTrace: stackTrace);
        return null;
      }
    });
  }
}

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

  // Get all feedback conversations for the current user
  Future<List<FeedbackConversation>> getUserFeedbackConversations({
    int limit = 20,
    bool includeAllMessages =
        true, // Set to false to limit message count for performance
    int maxMessages = 10, // Only used if includeAllMessages is false
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        Log.error('Cannot fetch feedback conversations: No user ID available');
        return [];
      }

      // Query the root-level collection for this user's conversations
      final querySnapshot = await firestoreFeedbackRef
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt', descending: true)
          .limit(limit)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Log.info('No feedback conversations found for user: $userId');
        return [];
      }

      Log.info(
          'Found ${querySnapshot.docs.length} feedback conversations for user: $userId');

      // Convert Firestore documents to FeedbackConversation objects
      return querySnapshot.docs.map((doc) {
        final data = doc.data();

        // Parse the messages
        List<FeedbackMessage> messages = [];
        if (data['messages'] != null) {
          final List<dynamic> rawMessages = data['messages'];

          // Optionally limit the number of messages for performance
          final messagesToProcess = includeAllMessages
              ? rawMessages
              : rawMessages.length > maxMessages
                  ? rawMessages.sublist(rawMessages.length - maxMessages)
                  : rawMessages;

          messages = messagesToProcess.map((msgData) {
            return FeedbackMessage(
              id: msgData['id'] ?? '',
              authorId: msgData['authorId'] ?? '',
              authorName: msgData['authorName'],
              messageText: msgData['messageText'],
              isFromTeam: msgData['isFromTeam'] ?? false,
              createdAt: DateTime.parse(msgData['createdAt']),
            );
          }).toList();
        }

        // Parse enum values from strings
        FeedbackResponseStatus? status;
        if (data['status'] != null) {
          try {
            status = FeedbackResponseStatus.values.firstWhere(
              (e) =>
                  e.toString().split('.').last.toUpperCase() == data['status'],
              orElse: () => FeedbackResponseStatus.pending,
            );
          } catch (_) {
            status = FeedbackResponseStatus.pending;
          }
        }

        FeedbackType? feedbackType;
        if (data['feedbackType'] != null) {
          try {
            feedbackType = FeedbackType.values.firstWhere(
              (e) =>
                  e.toString().split('.').last.toUpperCase() ==
                  data['feedbackType'],
              orElse: () => FeedbackType.featureRecommendation,
            );
          } catch (_) {
            feedbackType = FeedbackType.featureRecommendation;
          }
        }

        // Fixed parsing for FeelingRates - now handles null properly
        FeelingRates? sentiment;
        if (data['selectedSentiment'] != null) {
          try {
            // First check if the value exists in the enum
            final sentimentValues = FeelingRates.values.where(
              (e) =>
                  e.toString().split('.').last.toUpperCase() ==
                  data['selectedSentiment'],
            );

            // Only assign if we found a match
            if (sentimentValues.isNotEmpty) {
              sentiment = sentimentValues.first;
            }
          } catch (_) {
            // Leave sentiment as null if there's an error
          }
        }

        // Create the FeedbackConversation object
        return FeedbackConversation(
          id: data['id'] ?? doc.id,
          userId: data['userId'] ?? '',
          userDisplayName: data['userDisplayName'],
          userEmail: data['userEmail'],
          status: status,
          feedbackTitle: data['feedbackTitle'] ?? '',
          feedbackType: feedbackType,
          selectedSentiment: sentiment,
          messages: messages,
          createdAt: data['createdAt'] != null
              ? DateTime.parse(data['createdAt'])
              : DateTime.now(),
          updatedAt: data['updatedAt'] != null
              ? DateTime.parse(data['updatedAt'])
              : DateTime.now(),
        );
      }).toList();
    } catch (e) {
      Log.error('Failed to fetch user feedback conversations: $e');
      return [];
    }
  }

  // Get a single feedback conversation by ID
  Future<FeedbackConversation?> getFeedbackConversationById(
      String conversationId) async {
    try {
      final docSnapshot = await firestoreFeedbackRef.doc(conversationId).get();

      if (!docSnapshot.exists) {
        return null;
      }

      return FeedbackConversation.fromJson(docSnapshot.data()!);
    } catch (e) {
      Log.error('Error fetching feedback conversation: $e');
      return null;
    }
  }

  // Create a new feedback conversation
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
        'feedbackType': conversation.feedbackType == FeedbackType.bugReport
            ? 'BUG_REPORT'
            : 'FEATURE_RECOMMENDATION',
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

      if (messageText.trim().length > 1000) {
        throw Exception('Message exceeds 1000 characters');
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
      });

      Log.info('Message added to conversation: $conversationId');
    } catch (e) {
      Log.error('Failed to add message to conversation: $e');
      throw Exception('Failed to add message: $e');
    }
  }
}
