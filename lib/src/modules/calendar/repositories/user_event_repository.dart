import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_repository.g.dart';

@riverpod
UserEventRepository userEventRepository(Ref ref) {
  return UserEventRepository();
}

class UserEventRepository {
  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  Stream<List<UserEvent>> streamUserEvents(
    String userId,
    DateTime month,
  ) {
    final startOfMonth = DateTime(
      month.year,
      month.month,
      1,
    ).toUtc().toIso8601String();

    final endOfMonth = DateTime(
      month.year,
      month.month + 1,
      0,
      23,
      59,
      59,
    ).toUtc().toIso8601String();

    return firestoreUserRef
        .doc(userId)
        .collection(FirebaseCollectionName.events)
        .where('startDate', isGreaterThanOrEqualTo: startOfMonth)
        .where('startDate', isLessThanOrEqualTo: endOfMonth)
        .orderBy('startDate')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) {
            try {
              final event = UserEvent.fromJson(doc.data());
              return event;
            } catch (error) {
              throw Exception(
                'Error in parsing userEvent: $error',
              );
            }
          })
          .whereType<UserEvent>()
          .toList();
    });
  }

  Future<List<UserEvent>> fetchUserEvents(String userId) async {
    try {
      final snapshot = await firestoreUserRef
          .doc(userId)
          .collection(FirebaseCollectionName.events)
          .get();

      final events = snapshot.docs
          .map((doc) {
            final event = UserEvent.fromJson(doc.data());
            return event;
          })
          .whereType<UserEvent>()
          .toList();
      return events;
    } catch (error) {
      throw Exception(
        'Error in fetching userEvents: $error',
      );
    }
  }
}
