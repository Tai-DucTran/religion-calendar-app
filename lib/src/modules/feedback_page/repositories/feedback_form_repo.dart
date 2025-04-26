import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "feedback_form_repo.g.dart";

@riverpod
FeedbackFormRepository feedbackFormRepository(Ref ref) {
  return FeedbackFormRepository(ref);
}

class FeedbackFormRepository {
  final Ref _ref;
  FeedbackFormRepository(this._ref);

  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );
  String? get _currentUserId =>
      _ref.read(authStateControllerProvider).value?.userId;

  Future<void> createFeedbackForm(
    FeedbackForm feedbackForm,
  ) async {
    try {
      final userDocRef = firestoreUserRef.doc(_currentUserId);
      final feedbackDocRef = userDocRef
          .collection(
            FirebaseCollectionName.feedbackForms,
          )
          .doc();

      final feedbackId = feedbackDocRef.id;

      final updatedFeedbackForm = feedbackForm.copyWith(id: feedbackId);

      await feedbackDocRef.set(updatedFeedbackForm.toJson());

      Log.info('Feedback form created successfully with ID: $feedbackId');
    } catch (e) {
      Log.error('Failed to create feedback form: $e');
      throw Exception('Failed to create feedback form: $e');
    }
  }

  Future<List<FeedbackForm>> getUserFeedbackForms() async {
    if (_currentUserId == null) {
      Log.error('Cannot fetch feedback forms: No user ID available');
      return [];
    }

    try {
      final querySnapshot = await firestoreUserRef
          .doc(_currentUserId)
          .collection(
            FirebaseCollectionName.feedbackForms,
          )
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => FeedbackForm.fromJson(doc.data()))
          .toList();
    } catch (e) {
      Log.error('Failed to fetch user feedback forms: $e');
      return [];
    }
  }
}
