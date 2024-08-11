import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';

final authStateProvider = Provider<AuthStateController>(
  (ref) {
    return AuthStateController();
  },
);

final isLoggedInProvider = Provider<bool>(
  (ref) {
    final provider = ref.watch(authStateProvider);
    return provider.isAlreadyLoggedIn;
  },
);

final userIdProvider = Provider<String?>(
  (ref) {
    final provider = ref.watch(authStateProvider);
    return provider.userId;
  },
);

final isLoadingProvider = Provider<bool>((ref) {
  final provider = ref.watch(authStateProvider);
  return provider.isLoading ?? false;
});
