import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_state.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/modules/notification/notification.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
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
      final hasCompleteOnboarding =
          await userFireStoreRepo.hasCompleteOnboarding(userId: userId);

      return AuthState(
        result: AuthResults.success,
        isLoading: false,
        userId: authenticatorRepo.userId,
        isLoggedIn: isLoggedIn,
        hasCompleteOnboarding: hasCompleteOnboarding,
      );
    }
    return AuthState.unknown();
  }

  bool get isAlreadyLoggedIn => state.value?.result == AuthResults.success;
  String? get userId => state.value?.userId;
  bool? get isLoading => state.value?.isLoading;

  void updateOnboardingStatus(bool hasCompleted) {
    if (state.value != null) {
      state = AsyncValue.data(
          state.value!.copyWith(hasCompleteOnboarding: hasCompleted));
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
      }

      final hasCompleteOnboarding =
          await userFireStoreRepo.hasCompleteOnboarding(userId: userId ?? '');

      state = AsyncData(AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success,
        hasCompleteOnboarding: hasCompleteOnboarding,
      ));
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
      }

      state = AsyncValue.data(
        AuthState(
          result: result,
          isLoading: false,
          userId: userId,
          isLoggedIn: result == AuthResults.success ? true : false,
          hasCompleteOnboarding: false,
        ),
      );
    } catch (e) {
      state = const AsyncValue.data(
        AuthState(
          result: AuthResults.failure,
          isLoading: false,
          userId: null,
          isLoggedIn: false,
          hasCompleteOnboarding: false,
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
    final result = await authenticatorRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userId = authenticatorRepo.userId;
    final hasCompleteOnboarding =
        await userFireStoreRepo.hasCompleteOnboarding(userId: userId ?? '');

    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success ? true : false,
        hasCompleteOnboarding: hasCompleteOnboarding,
      ),
    );
  }

  // Future<void> completeOnboarding(ReligionPreference religionPreference) async {
  //   final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);
  //   final userId = state.value?.userId;

  //   if (userId != null) {
  //     await userFireStoreRepo.updateReligionPreferenceOnboarding(
  //       userId: userId,
  //       religionPreference: religionPreference,
  //     );

  //     state = AsyncValue.data(
  //       state.value?.copyWith(
  //         isLoggedIn: true,
  //         hasCompletedOnboarding: true,
  //       ),
  //     );
  //   }
  // }
}
