import 'package:religion_calendar_app/constants/firebase_field_name.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  FutureOr<UserState> build() async {
    final authState = await ref.watch(authStateControllerProvider.future);

    // If already logged in, fetch user data
    if (authState.isLoggedIn && authState.userId != null) {
      try {
        state = const AsyncLoading();
        final user = await ref
            .read(userFirestoreRepositoryProvider)
            .getUserDetailedInfor(authState.userId!);

        return UserState(
          isLoading: false,
          user: user,
          error: null,
        );
      } catch (error) {
        return UserState(
          isLoading: false,
          user: null,
          error: error.toString(),
        );
      }
    }

    ref.listen<AsyncValue<AuthState>>(
      authStateControllerProvider,
      (previous, next) async {
        next.whenData((auth) async {
          if (auth.isLoggedIn && auth.userId != null) {
            try {
              state = const AsyncLoading();
              final user = await ref
                  .read(userFirestoreRepositoryProvider)
                  .getUserDetailedInfor(auth.userId!);

              state = AsyncData(UserState(
                isLoading: false,
                user: user,
                error: null,
              ));
            } catch (error) {
              state = AsyncData(UserState(
                isLoading: false,
                user: null,
                error: error.toString(),
              ));
            }
          } else {
            state = AsyncData(UserState.unknow());
          }
        });
      },
    );

    return UserState.unknow();
  }

  UserFirestoreRepository get userFireStoreRepo =>
      ref.read(userFirestoreRepositoryProvider);

  Future<User?> fetchUserInfor(String userId) async {
    try {
      state = const AsyncLoading();
      return await userFireStoreRepo.getUserDetailedInfor(userId);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return null;
    }
  }

  Future<bool> updateUserFields({
    required Map<String, dynamic> fields,
  }) async {
    try {
      // Get the current auth state directly from the controller
      final currentAuthState =
          await ref.watch(authStateControllerProvider.future);
      final userId = currentAuthState.userId;

      if (userId == null) {
        throw Exception('Update user fields failed - userId is null');
      }

      // Update the data in Firestore
      final success = await userFireStoreRepo.updateUserField(
        userId: userId,
        fieldsToUpdate: fields,
      );

      if (success) {
        // Fetch the updated user data
        final updatedUser =
            await userFireStoreRepo.getUserDetailedInfor(userId);

        // Update UserController state
        state = AsyncData(UserState(
          isLoading: false,
          user: updatedUser,
          error: null,
        ));

        // Update AuthStateController directly
        if (updatedUser != null) {
          final authController = ref.read(authStateControllerProvider.notifier);
          authController.updateUserState(updatedUser);
        }

        return true;
      } else {
        return false;
      }
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return false;
    }
  }

  // Use the generic method for specific updates
  Future<bool> updateBasicUserInfo({required String input}) async {
    return updateUserFields(fields: {
      FirebaseFieldName.displayName: input,
    });
  }

  Future<bool> updateProfileImageUrl({required String url}) async {
    return updateUserFields(fields: {
      FirebaseFieldName.profileImageUrl: url,
    });
  }

  Future<bool> updateReligionPreference(
      {required ReligionPreference preference}) async {
    return updateUserFields(fields: {
      FirebaseFieldName.religionPreference: preference.toString(),
    });
  }

  Future<bool> completeOnboarding(
      {required ReligionPreference preference}) async {
    return updateUserFields(fields: {
      FirebaseFieldName.hasCompleteOnboarding: true,
      FirebaseFieldName.religionPreference: preference.toString(),
    });
  }
}
