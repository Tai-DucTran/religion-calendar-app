import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/pages/full_calendar_page.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/forgot_pasword_page.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:religion_calendar_app/src/modules/navigation_bottom_bar/widgets/organisms/navigation_bottom_bar.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/page/religion_preference_onboarding.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/page/page.dart';

import '../modules/home/widgets/pages/pages.dart';
import '../modules/profile/widgets/widgets.dart';

part 'routes.g.dart';

final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch>[
    // Add more main shell route below if we have more page in the future
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: HomeRoute.path,
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
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return NavigationBottomBar(
      navigationShell: navigationShell,
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
    return const ReligionPreferenceOnboarding();
  }
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  routes: [
    TypedGoRoute<FullCalendarRoute>(
      path: FullCalendarRoute.path,
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

class FullCalendarRoute extends GoRouteData {
  const FullCalendarRoute();
  static const path = 'full-calendar';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FullCalendarPage();
  }
}

/// [ProfileRoute] configuration:

@TypedGoRoute<ProfileRoute>(
  path: ProfileRoute.path,
  routes: [
    TypedGoRoute<BasicInfoSettingRoute>(
      path: BasicInfoSettingRoute.path,
    ),
    TypedGoRoute<ReligionPreferencesSettingRoute>(
      path: ReligionPreferencesSettingRoute.path,
    ),
    TypedGoRoute<NotificationSettingRoute>(
      path: NotificationSettingRoute.path,
    ),
    TypedGoRoute<FeedbackAndReportSettingRoute>(
      path: FeedbackAndReportSettingRoute.path,
    ),
    TypedGoRoute<HelpAndFAQsSettingRoute>(
      path: HelpAndFAQsSettingRoute.path,
    ),
    TypedGoRoute<TermsOfUseSettingRoute>(
      path: TermsOfUseSettingRoute.path,
    ),
    TypedGoRoute<PrivacyPolicySettingRoute>(
      path: PrivacyPolicySettingRoute.path,
    ),
  ],
)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();
  static const path = '/profile';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage();
  }
}

class BasicInfoSettingRoute extends GoRouteData {
  const BasicInfoSettingRoute();
  static const path = 'basic-info-setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BasicInfoSettingPage();
  }
}

class ReligionPreferencesSettingRoute extends GoRouteData {
  const ReligionPreferencesSettingRoute();
  static const path = 'religion-preference-setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReligionPreferenceOnboarding(
      isProfilePageSetting: true,
    );
  }
}

class NotificationSettingRoute extends GoRouteData {
  const NotificationSettingRoute();
  static const path = 'notification-setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationSettingPage();
  }
}

class FeedbackAndReportSettingRoute extends GoRouteData {
  const FeedbackAndReportSettingRoute();
  static const path = 'feedback-and-report';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FeedbackAndReportSettingPage();
  }
}

class HelpAndFAQsSettingRoute extends GoRouteData {
  const HelpAndFAQsSettingRoute();
  static const path = 'help-and-faqs';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HelpAndFAQsSettingPage();
  }
}

class TermsOfUseSettingRoute extends GoRouteData {
  const TermsOfUseSettingRoute();
  static const path = 'terms-of-use';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TermsOfUseSettingPage();
  }
}

class PrivacyPolicySettingRoute extends GoRouteData {
  const PrivacyPolicySettingRoute();
  static const path = 'privacy-policy';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PrivacyPolicySettingPage();
  }
}
