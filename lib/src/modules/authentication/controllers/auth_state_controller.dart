import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_state.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_controller.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController {
  @override
  FutureOr<AuthState> build() async {
    final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);

    if (authenticatorRepo.isAlreadyLoggedIn) {
      return AuthState(
        result: AuthResults.success,
        isLoading: false,
        userId: authenticatorRepo.userId,
      );
    }
    return AuthState.unknown();
  }

  Future<void> logOut() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    state = const AsyncValue.loading();
    await authenticatorRepo.logOut();
    state = AsyncValue.data(AuthState.unknown());
  }

  Future<void> loginWithGoogle() async {
    final authenticatorRepo = ref.read(authenticatorRepositoryProvider);
    final userFireStoreRepo = ref.read(userFirestoreRepositoryProvider);

    state = const AsyncLoading();
    final result = await authenticatorRepo.loginWithGoogle();
    final userId = authenticatorRepo.userId;

    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
      ),
    );

    if (result == AuthResults.success && userId != null) {
      final user = User(
        userId: userId,
        displayName: authenticatorRepo.displayName,
        email: authenticatorRepo.email,
      );
      await userFireStoreRepo.createUserDoc(user);
    }
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
      );
      await userFireStoreRepo.createUserDoc(user);
    }
    state = AsyncValue.data(
      AuthState(
        result: result,
        isLoading: false,
        userId: userId,
      ),
    );
  }

  bool get isAlreadyLoggedIn => state.value?.result == AuthResults.success;
}
