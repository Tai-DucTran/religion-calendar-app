import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
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

  const FirebaseFieldName._();
}
