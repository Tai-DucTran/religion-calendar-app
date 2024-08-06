import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/router/routes.dart';
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

      // If the auth state is still loading, don't redirect
      if (auth is AsyncLoading) {
        return null;
      }

      final isLoggedIn = auth.value?.isLoggedIn ?? false;
      final hasCompletedOnboarding = auth.value?.hasCompleteOnboarding ?? false;

      final isSignUpPage =
          state.matchedLocation == const SignUpRoute().location;
      final isOnboardingPage =
          state.matchedLocation == const OnboardingRoute().location;
      final isHomePage = state.matchedLocation == const HomeRoute().location;

      // If not logged in, redirect to sign up page unless already there
      if (!isLoggedIn && !isSignUpPage) {
        return const SignUpRoute().location;
      }

      // If logged in but hasn't completed onboarding, redirect to onboarding unless already there
      if (isLoggedIn && !hasCompletedOnboarding && !isOnboardingPage) {
        return const OnboardingRoute().location;
      }

      // If logged in and completed onboarding, redirect to home unless already there
      if (isLoggedIn && hasCompletedOnboarding && !isHomePage) {
        return const HomeRoute().location;
      }

      // In all other cases, don't redirect
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
