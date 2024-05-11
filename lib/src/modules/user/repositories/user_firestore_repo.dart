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

  Future<bool> createUserDoc(User user) async {
    final userInfo = await firestore
        .collection(FirebaseCollectionName.users)
        .where(FirebaseFieldName.userId, isEqualTo: user.userId)
        .limit(1)
        .get();

    try {
      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: user.displayName,
          FirebaseFieldName.email: user.email,
        });
        return true;
      }

      final payload = UserInfoPayLoad(
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
          .add(
            payload,
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}
