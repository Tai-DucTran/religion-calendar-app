import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_state.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_controller.g.dart';

@riverpod
class AuthStateController extends _$AuthStateController {
  @override
  FutureOr<AuthState> build() async {
    final repo = ref.watch(authenticatorRepositoryProvider);

    if (repo.isAlreadyLoggedIn) {
      return AuthState(
        result: AuthResults.success,
        isLoading: false,
        userId: repo.userId,
      );
    }
    return AuthState.unknown();
  }

  Future<void> logOut() async {
    final repo = ref.read(authenticatorRepositoryProvider);
    state = const AsyncValue.loading();
    await repo.logOut();
    state = AsyncValue.data(AuthState.unknown());
  }

  Future<void> loginWithGoogle() async {
    final repo = ref.read(authenticatorRepositoryProvider);
    state = const AsyncLoading();
    final result = await repo.loginWithGoogle();
    final userId = repo.userId ?? '';

    result.log();
    userId.log();
  }
}
