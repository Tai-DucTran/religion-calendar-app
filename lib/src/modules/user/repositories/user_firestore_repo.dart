import 'package:religion_calendar_app/src/constants/constants.dart';
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserInfor(
      String userId) async {
    return await firestore
        .collection(FirebaseCollectionName.users)
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
        createdAt: DateTime.now(),
        religionReference: user.religionReference,
      );
      await firestore
          .collection(
            FirebaseCollectionName.users,
          )
          .doc(payload.userId)
          .set(
            payload.toJson(),
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  // TODO: Implement onboarding page
  Future<void> updateUserReligion(User user) async {}
}
