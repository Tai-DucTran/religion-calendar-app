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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> saveUserInfo(User user) async {
    'check the saveUserInfo process'.log();
    '---'.log();
    'user log'.log();
    user.log();

    final userInfo = await firestore
        .collection(FirebaseCollectionName.users)
        .where(FirebaseFieldName.userId, isEqualTo: user.userId)
        .limit(1)
        .get();
    '---'.log();
    'userInfo log'.log();
    userInfo.log();

    try {
      if (userInfo.docs.isNotEmpty) {
        'userInfo is not empty'.log();
        'perform updating userInfo'.log();
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: user.displayName,
          FirebaseFieldName.email: user.email ?? '',
        });
        return true;
      }

      'userInfor is empty'.log();
      final payload = UserInfoPayLoad(
        userId: user.userId,
        displayName: user.displayName,
        email: user.email,
        createdAt: DateTime.now(),
        religionReference: user.religionReference,
      );
      'perform creating new data....'.log();
      await firestore
          .collection(
            FirebaseCollectionName.users,
          )
          .doc(payload.userId)
          .set(
            payload.toJson(),
          );
      'perform successfull!'.log();
      return true;
    } catch (e) {
      return false;
    }
  }
}
