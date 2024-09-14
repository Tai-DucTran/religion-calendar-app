import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/forgot_pasword_page.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:religion_calendar_app/src/modules/navigation_bottom_bar/widgets/organisms/navigation_bottom_bar.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/page/onboarding_religion_preference_page.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/page/page.dart';

import '../explore_page/widgets/widgets.dart';
import '../home/widgets/pages/pages.dart';
import '../profile_page/widgets/widgets.dart';

part 'routes.g.dart';

final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch>[
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: HomeRoute.path,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<CalendarRoute>(
          path: CalendarRoute.path,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ExploreRoute>(
          path: ExploreRoute.path,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: ProfileRoute.path,
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData({required this.userId});
  final String? userId;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    final userId = state.uri.queryParameters['userId'];

    return NavigationBottomBar(
      navigationShell: navigationShell,
      userId: userId,
    );
  }
}

@TypedGoRoute<SignUpRoute>(
  path: SignUpRoute.path,
  routes: [
    TypedGoRoute<LoginRoute>(
      path: LoginRoute.path,
      routes: [
        TypedGoRoute<LoginForgotPasswordRoute>(
          path: LoginForgotPasswordRoute.path,
        ),
      ],
    ),
    TypedGoRoute<VerifiedRoute>(
      path: VerifiedRoute.path,
    ),
  ],
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();
  static const path = '/signup';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = 'login';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

class VerifiedRoute extends GoRouteData {
  const VerifiedRoute();
  static const path = 'verified';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const VerifiedPage();
  }
}

class LoginForgotPasswordRoute extends GoRouteData {
  const LoginForgotPasswordRoute();
  static const path = 'forgot-password';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPaswordPage();
  }
}

@TypedGoRoute<OnboardingRoute>(
  path: OnboardingRoute.path,
)
class OnboardingRoute extends GoRouteData {
  const OnboardingRoute();
  static const path = '/onboarding';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingReligionPreferencePage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)
class HomeRoute extends GoRouteData {
  const HomeRoute({
    required this.userId,
  });
  static const path = '/home';
  final String? userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final userId = state.uri.queryParameters['userId'];
    return HomePage(userId: userId);
  }
}

class CalendarRoute extends GoRouteData {
  const CalendarRoute({
    required this.userId,
  });
  static const path = '/calendar';
  final String? userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final userId = state.uri.queryParameters['userId'];
    return CalendarPage(userId: userId);
  }
}

class ExploreRoute extends GoRouteData {
  const ExploreRoute({
    required this.userId,
  });
  static const path = '/explore';
  final String? userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ExplorePage(userId: userId);
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute({
    required this.userId,
  });
  static const path = '/profile';
  final String? userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage(userId: userId);
  }
}
