import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_state.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/modules/notification/notification.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthStateController extends _$AuthStateController {
  @override
  FutureOr<AuthState> build() async {
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    final isLoggedIn = authenticatorRepo.isAlreadyLoggedIn;
    final userId = authenticatorRepo.userId ?? '';

    if (isLoggedIn) {
      try {
        final user = await userFireStoreRepo.getUserDetailedInfor(userId);

        return AuthState(
          result: AuthResults.success,
          isLoading: false,
          user: user,
        );
      } catch (e, stackTrace) {
        Log.error("Error in getting user detailed infor: $e",
            error: e, stackTrace: stackTrace);
        return AuthState(
          result: AuthResults.success,
          isLoading: false,
          user: User(
            userId: userId,
            displayName: authenticatorRepo.displayName,
            email: authenticatorRepo.email,
            hasCompleteOnboarding: false,
          ),
        );
      }
    }

    return AuthState.unknown();
  }

  bool get isAlreadyLoggedIn => state.value?.result == AuthResults.success;
  String? get userId => state.value?.user?.userId;
  bool? get isLoading => state.value?.isLoading;

  void updateOnboardingStatus(bool hasCompleted) {
    if (state.value != null && state.value!.user != null) {
      final updatedUser =
          state.value!.user!.copyWith(hasCompleteOnboarding: hasCompleted);

      state = AsyncValue.data(state.value!.copyWith(user: updatedUser));
    }
  }

  Future<void> logOut() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userId = authenticatorRepo.userId;

    if (userId != null) {
      final deviceTokenRepo = ref.read(deviceTokenRepositoryProvider);
      await deviceTokenRepo.removeDeviceToken(userId);
    }

    await authenticatorRepo.logOut();
    state = const AsyncValue.loading();
    state = AsyncValue.data(AuthState.unknown());
  }

  Future<void> loginWithGoogle() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();

    try {
      final result = await authenticatorRepo.loginWithGoogle();
      final userId = authenticatorRepo.userId;

      if (result == AuthResults.success && userId != null) {
        final user = User(
          userId: userId,
          displayName: authenticatorRepo.displayName,
          email: authenticatorRepo.email,
          isVerified: true,
        );
        await userFireStoreRepo.saveUserInfo(user);

        final deviceTokenRepo = ref.read(deviceTokenRepositoryProvider);
        await deviceTokenRepo.saveDeviceToken(userId);

        // Fetch the complete user data from Firestore
        final userData = await userFireStoreRepo.getUserDetailedInfor(userId);

        state = AsyncData(AuthState(
          result: result,
          isLoading: false,
          user: userData ?? user,
        ));
      } else {
        state = AsyncData(AuthState(
          result: result,
          isLoading: false,
          user: null,
        ));
      }
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();
    try {
      final result = await authenticatorRepo.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = authenticatorRepo.userId;

      if (result == AuthResults.success && userId != null) {
        final user = User(
          userId: userId,
          displayName: email,
          email: email,
        );
        await userFireStoreRepo.saveUserInfo(user);

        final deviceTokenRepo = ref.read(deviceTokenRepositoryProvider);
        await deviceTokenRepo.saveDeviceToken(userId);

        state = AsyncValue.data(
          AuthState(
            result: result,
            isLoading: false,
            user: user,
          ),
        );
      } else {
        state = AsyncValue.data(
          AuthState(
            result: result,
            isLoading: false,
            user: null,
          ),
        );
      }
    } catch (e) {
      state = const AsyncValue.data(
        AuthState(
          result: AuthResults.failure,
          isLoading: false,
          user: null,
        ),
      );
      rethrow;
    }
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();

    try {
      final result = await authenticatorRepo.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = authenticatorRepo.userId;

      if (result == AuthResults.success && userId != null) {
        final userData = await userFireStoreRepo.getUserDetailedInfor(userId);

        state = AsyncValue.data(
          AuthState(
            result: result,
            isLoading: false,
            user: userData,
          ),
        );
      } else {
        state = AsyncValue.data(
          AuthState(
            result: result,
            isLoading: false,
            user: null,
          ),
        );
      }
    } catch (e) {
      state = AsyncValue.data(
        AuthState(
          result: AuthResults.failure,
          isLoading: false,
          user: null,
        ),
      );
      rethrow;
    }
  }

  void updateUserState(User updatedUser) {
    if (state.value != null) {
      state = AsyncValue.data(
        AuthState(
          result: state.value!.result,
          isLoading: state.value!.isLoading,
          user: updatedUser,
        ),
      );
    }
  }
}
