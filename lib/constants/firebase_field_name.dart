import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const id = 'id';

  /// User properties
  static const userId = 'userId';
  static const displayName = 'displayName';
  static const email = 'email';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const hasCompleteOnboarding = 'hasCompleteOnboarding';
  static const isVerified = 'isVerified';
  static const religionPreference = 'religionPreference';

  /// Event properties
  static const eventId = 'eventId';
  static const eventName = 'eventName';
  static const eventDescription = 'eventDescription';
  static const markedEvent = '';
  static const notedEvent = '';
  static const sharedEventWithMembers = 'sharedEventWithMembers';

  // FeedbackConverstation
  static const status = 'status';
  static const userDisplayName = 'userDisplayName';
  static const userEmail = 'userEmail';
  static const feedbackTitle = 'feedbackTitle';
  static const feedbackType = 'feedbackType';
  static const selectedSentiment = 'selectedSentiment';
  static const messages = 'messages';
  static const authorId = 'authorId';
  static const authorName = 'authorName';
  static const messageText = 'messageText';
  static const isFromTeam = 'isFromTeam';

  const FirebaseFieldName._();
}
