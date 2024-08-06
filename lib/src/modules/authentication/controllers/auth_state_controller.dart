import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_state.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_controller.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController {
  @override
  FutureOr<AuthState> build() async {
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);

    final isLoggedIn = authenticatorRepo.isAlreadyLoggedIn;
    'isUserLoggedIn'.log();
    isLoggedIn.log();

    if (isLoggedIn) {
      return AuthState(
        result: AuthResults.success,
        isLoading: false,
        userId: authenticatorRepo.userId,
        isLoggedIn: isLoggedIn,
      );
    }
    return AuthState.unknown();
  }

  bool get isAlreadyLoggedIn => state.value?.result == AuthResults.success;

  Future<void> logOut() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    await authenticatorRepo.logOut();
    state = const AsyncValue.loading();
    state = AsyncValue.data(AuthState.unknown());
  }

  Future<void> loginWithGoogle() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();
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
    }

    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success ? true : false,
      ),
    );
  }

  Future<void> loginWithFacebook() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();
    final result = await authenticatorRepo.loginWithFacebook();
    final userId = authenticatorRepo.userId;

    if (result == AuthResults.success && userId != null) {
      final user = User(
        userId: userId,
        displayName: authenticatorRepo.displayName,
        email: authenticatorRepo.email,
        isVerified: true,
      );
      await userFireStoreRepo.saveUserInfo(user);
    }
    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success ? true : false,
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();
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
    }
    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success ? true : false,
      ),
    );
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);

    state = const AsyncLoading();
    final result = await authenticatorRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userId = authenticatorRepo.userId;

    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
        isLoggedIn: result == AuthResults.success ? true : false,
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
