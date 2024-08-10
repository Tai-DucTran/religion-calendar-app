import 'package:religion_calendar_app/src/constants/constants.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

part 'user_firestore_repo.g.dart';

@riverpod
UserFirestoreRepository userFirestoreRepository(
    UserFirestoreRepositoryRef ref) {
  return UserFirestoreRepository();
}

class UserFirestoreRepository {
  UserFirestoreRepository();

  final firestoreUserRef = FirebaseFirestore.instance.collection(
    FirebaseCollectionName.users,
  );

  Future<QuerySnapshot<Map<String, dynamic>?>> fetchUserInfor(
      UserId userId) async {
    return await firestoreUserRef
        .where(FirebaseFieldName.userId, isEqualTo: userId)
        .limit(1)
        .get();
  }

  Future<User?> getUserDetailedInfor(String userId) async {
    final userDoc = await fetchUserInfor(userId);

    return userDoc.docs.first.data() as User;
  }

  Future<bool> saveUserInfo(User user) async {
    final userDoc = await fetchUserInfor(user.userId);

    try {
      if (userDoc.docs.isNotEmpty) {
        await userDoc.docs.first.reference.update({
          FirebaseFieldName.displayName: user.displayName,
          FirebaseFieldName.email: user.email ?? '',
        });
        return true;
      }

      final payload = User(
        userId: user.userId,
        displayName: user.displayName,
        email: user.email,
        isVerified: user.isVerified,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        religionPreference: user.religionPreference,
      );
      await firestoreUserRef.doc(payload.userId).set(
            payload.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  // TODO: Implement onboarding page
  Future<void> updateReligionPreferenceOnboarding({
    required UserId? userId,
    required String religionPreference,
  }) async {
    try {
      final payload = {
        'hasCompleteOnboarding': true,
        'religionPreference': religionPreference.toString(),
      };

      firestoreUserRef.doc(userId).set(
            payload,
            SetOptions(merge: true),
          );
    } catch (error) {
      error.log();
      throw Exception(error);
    }
  }

  Future<bool> hasCompleteOnboarding({
    required UserId userId,
  }) async {
    try {
      final result = await fetchUserInfor(userId);

      if (result.docs.isNotEmpty) {
        final userData = result.docs.first.data();

        if (userData != null &&
            userData.containsKey(FirebaseFieldName.hasCompleteOnboarding)) {
          final hasCompleted =
              userData[FirebaseFieldName.hasCompleteOnboarding] as bool? ??
                  false;
          return hasCompleted;
        }
      }
      return false;
    } catch (error) {
      error.log();
      throw Exception(error);
    }
  }
}
