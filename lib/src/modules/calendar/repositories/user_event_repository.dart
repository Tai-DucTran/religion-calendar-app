import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_repository.g.dart';

class UserEventException implements Exception {
  final String message;
  final dynamic originalError;

  UserEventException(this.message, [this.originalError]);

  @override
  String toString() =>
      'UserEventException: $message${originalError != null ? '\nOriginal error: $originalError' : ''}';
}

@riverpod
UserEventRepository userEventRepository(Ref ref) {
  return UserEventRepository();
}

class UserEventRepository {
  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  Stream<List<UserEvent>> streamUserEventsByMonth(
    String userId,
    DateTime month,
  ) {
    try {
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
    } catch (error) {
      return Stream.error(
        UserEventException('Failed to create user events stream', error),
      );
    }
  }

  Future<List<UserEvent>> fetchUserEvents(String userId) async {
    try {
      final snapshot = await firestoreUserRef
          .doc(userId)
          .collection(FirebaseCollectionName.events)
          .get()
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw UserEventException('Fetch timeout'),
          );

      final events = <UserEvent>[];

      for (final doc in snapshot.docs) {
        try {
          final event = UserEvent.fromJson(doc.data());
          events.add(event);
        } catch (e, stackTrace) {
          Log.error('Error parsing event document ${doc.id}: $e');
          Log.error('Error parsing event document Stack trace: $stackTrace');
        }
      }

      return events;
    } on FirebaseException catch (e) {
      throw UserEventException('Firebase error: ${e.message}', e);
    } on UserEventException {
      rethrow;
    } catch (e) {
      throw UserEventException('Unexpected error fetching user events', e);
    }
  }

  Future<List<({UserEvent event, DocumentSnapshot snapshot})>>
      fetchUpcomingUserEvents({
    required String userId,
    DocumentSnapshot? lastDocument,
    int limit = limitedPagination,
  }) async {
    try {
      final now = DateTime.now();
      final today =
          DateTime(now.year, now.month, now.day).toUtc().toIso8601String();

      Query<Map<String, dynamic>> query = firestoreUserRef
          .doc(userId)
          .collection(FirebaseCollectionName.events)
          .where('startDate', isGreaterThanOrEqualTo: today)
          .orderBy('startDate')
          .limit(limit);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final querySnapshot = await query.get().timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw UserEventException('Fetch timeout'),
          );

      return querySnapshot.docs.map((doc) {
        try {
          final event = UserEvent.fromJson(doc.data());
          return (event: event, snapshot: doc);
        } catch (error) {
          throw UserEventException(
            'Error parsing event document ${doc.id}',
            error,
          );
        }
      }).toList();
    } on FirebaseException catch (e) {
      throw UserEventException('Firebase error: ${e.message}', e);
    } on UserEventException {
      rethrow;
    } catch (e) {
      throw UserEventException('Unexpected error fetching upcoming events', e);
    }
  }
}
