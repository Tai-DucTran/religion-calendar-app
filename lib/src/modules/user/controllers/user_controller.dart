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
      final user = await fetchUserInfor(authState.userId!);
      return UserState(
        isLoading: false,
        user: user,
        error: null,
      );
    }

    // Set up listener for future auth changes
    ref.listen<AsyncValue<AuthState>>(
      authStateControllerProvider,
      (previous, next) async {
        next.whenData((auth) async {
          if (auth.isLoggedIn && auth.userId != null) {
            final user = await fetchUserInfor(auth.userId!);
            state = AsyncData(UserState(
              isLoading: false,
              user: user,
              error: null,
            ));
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

  Future<bool> updateBasicUserInfo({
    required String input,
  }) async {
    try {
      final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);
      final authState = ref.read(authStateControllerProvider);
      final userId = authState.value?.userId;

      if (userId == null) {
        throw Exception(
          'Update basic user info failed - userId is null',
        );
      }

      state = await AsyncValue.guard(() async {
        await userFireStoreRepo.updateBasicUserInfo(
          userId: userId,
          newUserName: input,
        );
        final userData = await fetchUserInfor(userId);
        return UserState(
          isLoading: false,
          user: userData,
          error: null,
        );
      });
      return true;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      return false;
    }
  }
}
