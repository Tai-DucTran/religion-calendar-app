import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

part 'user_firestore_repo.g.dart';

/// ! Restructure this Firestore implementation
/// Create a new folder to store everything related to [Firebase] and [Firestore]
/// lib/core/firebase
/// lib/core/firebase_provider

@riverpod
UserFirestoreRepository userFirestoreRepository(Ref ref) {
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

    if (userDoc.docs.isEmpty) {
      return null;
    }

    final userDataJson = userDoc.docs.first.data();

    if (userDataJson != null) {
      return User.fromJson(userDataJson);
    }

    return null;
  }

  // Generic method to update user fields
  Future<bool> updateUserField({
    required UserId userId,
    required Map<String, dynamic> fieldsToUpdate,
    bool createIfMissing = true,
  }) async {
    try {
      if (userId.isEmpty) {
        Log.error('Error updating user fields: userId is empty');
        return false;
      }

      // Always add updatedAt timestamp with any update
      final payload = {
        ...fieldsToUpdate,
        FirebaseFieldName.updatedAt: FieldValue.serverTimestamp(),
      };

      // If document doesn't exist and createIfMissing is true, this will create it
      await firestoreUserRef.doc(userId).set(
            payload,
            SetOptions(
              merge: true,
            ),
          );

      Log.info('Updated user fields: ${fieldsToUpdate.keys.join(", ")}');
      return true;
    } catch (error, stackTrace) {
      Log.error(
        'Error updating user fields',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  Future<bool> updateUserFieldWithTransaction({
    required UserId userId,
    required Map<String, dynamic> fieldsToUpdate,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;

      return await firestore.runTransaction<bool>((transaction) async {
        final userDoc = await firestoreUserRef.doc(userId).get();

        if (!userDoc.exists &&
            !fieldsToUpdate.containsKey(FirebaseFieldName.userId)) {
          // If we're updating a doc that doesn't exist and not providing userId, fail
          Log.error('Error in transaction: Document does not exist');
          return false;
        }

        final updatedFields = {
          ...fieldsToUpdate,
          FirebaseFieldName.updatedAt: FieldValue.serverTimestamp(),
        };

        transaction.set(
          firestoreUserRef.doc(userId),
          updatedFields,
          SetOptions(merge: true),
        );

        return true;
      });
    } catch (error, stackTrace) {
      Log.error(
        'Error in transaction updating user fields',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  // Create or update entire user document
  Future<bool> saveUserInfo(User user) async {
    try {
      // Check if user exists
      final userDoc = await fetchUserInfor(user.userId);
      final now = DateTime.now();
      Map<String, dynamic> payload;

      if (userDoc.docs.isNotEmpty) {
        // Update existing user
        payload = {
          FirebaseFieldName.displayName: user.displayName,
          FirebaseFieldName.email: user.email ?? '',
          FirebaseFieldName.updatedAt: now,
        };

        // Only include profileImageUrl if it's not null
        if (user.profileImageUrl != null) {
          payload[FirebaseFieldName.profileImageUrl] = user.profileImageUrl;
        }
      } else {
        // Create new user
        payload = {
          FirebaseFieldName.userId: user.userId,
          FirebaseFieldName.displayName: user.displayName,
          FirebaseFieldName.email: user.email ?? '',
          FirebaseFieldName.createdAt: now,
          FirebaseFieldName.updatedAt: now,
          FirebaseFieldName.isVerified: user.isVerified ?? false,
        };

        // Only include non-null fields
        if (user.profileImageUrl != null) {
          payload[FirebaseFieldName.profileImageUrl] = user.profileImageUrl;
        }
        if (user.religionPreference != null) {
          payload[FirebaseFieldName.religionPreference] =
              user.religionPreference.toString();
        }
      }

      await firestoreUserRef.doc(user.userId).set(
            payload,
            SetOptions(
              merge: true,
            ),
          );

      return true;
    } catch (error, stackTrace) {
      Log.error(
        'Error saving user info',
        error: error,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  // These methods can be simplified to use updateUserField
  Future<void> updateReligionPreferenceOnboarding({
    required UserId? userId,
    required String religionPreference,
  }) async {
    if (userId == null) {
      throw Exception('Cannot update religion preference: userId is null');
    }

    final success = await updateUserField(
      userId: userId,
      fieldsToUpdate: {
        FirebaseFieldName.hasCompleteOnboarding: true,
        FirebaseFieldName.religionPreference: religionPreference,
      },
    );

    if (!success) {
      throw Exception('Failed to update religion preference');
    }
  }

  Future<void> updateBasicUserInfo({
    required UserId? userId,
    required String newUserName,
  }) async {
    if (userId == null) {
      throw Exception('Cannot update user info: userId is null');
    }

    final success = await updateUserField(
      userId: userId,
      fieldsToUpdate: {
        FirebaseFieldName.displayName: newUserName,
      },
    );

    if (!success) {
      throw Exception('Update user name failed');
    }
  }

  Future<void> updateProfileImageUrl({
    required UserId userId,
    required String imageUrl,
  }) async {
    final success = await updateUserField(
      userId: userId,
      fieldsToUpdate: {
        FirebaseFieldName.profileImageUrl: imageUrl,
      },
    );

    if (!success) {
      throw Exception('Failed to update profile image URL');
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
    } catch (error, stackTrace) {
      Log.error(
        'Error checking hasCompleteOnboarding',
        error: error,
        stackTrace: stackTrace,
      );
      throw Exception(error);
    }
  }
}
