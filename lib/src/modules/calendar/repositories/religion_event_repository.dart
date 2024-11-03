import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:religion_calendar_app/constants/firebase_collection_name.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'religion_event_repository.g.dart';

@riverpod
ReligionEventRepository religionEventRepository(
    ReligionEventRepositoryRef ref) {
  return ReligionEventRepository();
}

class ReligionEventRepository {
  final firestoreReligionsRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.religions,
  );
  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

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
