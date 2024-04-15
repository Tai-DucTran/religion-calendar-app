import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'userId';
  static const email = 'email';
  static const displayName = 'displayName';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const religionReference = 'religionReference';
  static const eventId = 'eventId';
  static const eventName = 'eventName';
  static const eventDescription = 'eventDescription';
  static const sharedEventWithMember = 'sharedEventWithMember';

  const FirebaseFieldName._();
}
