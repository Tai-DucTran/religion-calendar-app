import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/firebase_collection_name.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_repository.g.dart';

@riverpod
ReligionEventRepository religionEventRepository(Ref ref) {
  return ReligionEventRepository();
}

class ReligionEventRepository {
  final firestoreReligionsRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.religions,
  );
  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  Stream<List<ReligionEvent>> streamReligionEvents(
    ReligionPreference religion,
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

    return firestoreReligionsRef
        .doc(religion.name.toLowerCase())
        .collection(FirebaseCollectionName.events)
        .where('startDate', isGreaterThanOrEqualTo: startOfMonth)
        .where('startDate', isLessThanOrEqualTo: endOfMonth)
        .orderBy('startDate')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) {
            try {
              final event = ReligionEvent.fromJson(doc.data());
              return event;
            } catch (error) {
              throw Exception(
                'Error in parsing religionEvent: $error',
              );
            }
          })
          .whereType<ReligionEvent>()
          .toList();
    });
  }

  Future<List<ReligionEvent>> fetchReligionEvents(
      ReligionPreference religion) async {
    try {
      final snapshot = await firestoreReligionsRef
          .doc(religion.name.toLowerCase())
          .collection(FirebaseCollectionName.events)
          .get();

      final events = snapshot.docs
          .map((doc) {
            final event = ReligionEvent.fromJson(doc.data());
            return event;
          })
          .whereType<ReligionEvent>()
          .toList();
      return events;
    } catch (error) {
      throw Exception(
        'Error in fetching religionEvents: $error',
      );
    }
  }
}
