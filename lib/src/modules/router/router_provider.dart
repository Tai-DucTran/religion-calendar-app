import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      authStateControllerProvider
          .select((value) => value.whenData((data) => data.isLoggedIn)),
      (_, value) {
        isAuth.value = value;
      },
    );

  final router = GoRouter(
    navigatorKey: rootKey,
    refreshListenable: Listenable.merge([isAuth]),
    initialLocation: const SignUpRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final error = isAuth.value.unwrapPrevious().error;

      if (error != null) {}

      final isSignUpPage = state.uri.path == const SignUpRoute().location;

      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return null;
      }

      final auth = isAuth.value.requireValue;

      if (isSignUpPage) {
        return auth ? const HomeRoute().location : const SignUpRoute().location;
      }

      if (state.uri.path == const SignUpRoute().location && auth) {
        return const HomeRoute().location;
      }
      if (state.uri.path == const HomeRoute().location && !auth) {
        return const SignUpRoute().location;
      }

      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
