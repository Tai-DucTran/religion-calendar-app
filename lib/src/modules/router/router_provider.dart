import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/router/routes.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ValueNotifier<AsyncValue<AuthState>>(const AsyncLoading());

  ref
    ..onDispose(authState.dispose)
    ..listen(authStateControllerProvider, (_, value) {
      authState.value = value;
    });

  final router = GoRouter(
    navigatorKey: rootKey,
    refreshListenable: Listenable.merge([authState]),
    initialLocation: const SignUpRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final auth = authState.value;

      if (auth is AsyncLoading) {
        return null;
      }

      final isLoggedIn = auth.value?.isLoggedIn ?? false;
      final hasCompletedOnboarding = auth.value?.hasCompleteOnboarding ?? false;

      final isSignUpPage =
          state.matchedLocation == const SignUpRoute().location;
      final isOnboardingPage =
          state.matchedLocation == const OnboardingRoute().location;
      final isInMainShell = state.matchedLocation.startsWith('/home') ||
          state.matchedLocation.startsWith('/calendar') ||
          state.matchedLocation.startsWith('/explore') ||
          state.matchedLocation.startsWith('/profile');

      if (!isLoggedIn && !isSignUpPage) {
        return const SignUpRoute().location;
      }

      if (isLoggedIn && !hasCompletedOnboarding && !isOnboardingPage) {
        return const OnboardingRoute().location;
      }

      if (isLoggedIn && hasCompletedOnboarding && !isInMainShell) {
        return const HomeRoute().location;
      }
      "Redirecting. Current location: ${state.matchedLocation}".log();
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
