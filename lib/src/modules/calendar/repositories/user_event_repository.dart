import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_event_repository.g.dart';

@riverpod
UserEventRepository userEventRepository(UserEventRepositoryRef ref) {
  return UserEventRepository();
}

class UserEventRepository {
  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  Future<List<UserEvent>> fetchUserEvents(String userId) async {
    try {
      final snapshot = await firestoreUserRef
          .doc(userId)
          .collection(FirebaseCollectionName.userEvents)
          .get();

      print('Tai logs - snapshot length: ${snapshot.docs.length}');

      final events = snapshot.docs
          .map((doc) {
            print('Tai logs - Processing document: ${doc.id}');
            try {
              final event = UserEvent.fromJson(doc.data());
              print(
                  'Tai logs - Successfully created UserEvent: ${event.title}');
              return event;
            } catch (e) {
              print(
                  'Tai logs - Error creating UserEvent from doc ${doc.id}: $e');
              return null;
            }
          })
          .whereType<UserEvent>()
          .toList();

      print('Tai logs - Processed events count: ${events.length}');
      return events;
    } catch (e) {
      print('Tai logs - Error in fetchUserEvents: $e');
      return [];
    }
  }
}
