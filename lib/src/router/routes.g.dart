// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
      $signUpRoute,
      $onboardingRoute,
      $homeRoute,
      $profileRoute,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/daily-activities',
              factory: $DailyActivitiesRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/explore',
              factory: $ExploreRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DailyActivitiesRouteExtension on DailyActivitiesRoute {
  static DailyActivitiesRoute _fromState(GoRouterState state) =>
      const DailyActivitiesRoute();

  String get location => GoRouteData.$location(
        '/daily-activities',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExploreRouteExtension on ExploreRoute {
  static ExploreRoute _fromState(GoRouterState state) => const ExploreRoute();

  String get location => GoRouteData.$location(
        '/explore',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpRoute => GoRouteData.$route(
      path: '/signup',
      factory: $SignUpRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $LoginRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'forgot-password',
              factory: $LoginForgotPasswordRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'verified',
          factory: $VerifiedRouteExtension._fromState,
        ),
      ],
    );

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  String get location => GoRouteData.$location(
        '/signup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/signup/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginForgotPasswordRouteExtension on LoginForgotPasswordRoute {
  static LoginForgotPasswordRoute _fromState(GoRouterState state) =>
      const LoginForgotPasswordRoute();

  String get location => GoRouteData.$location(
        '/signup/login/forgot-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $VerifiedRouteExtension on VerifiedRoute {
  static VerifiedRoute _fromState(GoRouterState state) => const VerifiedRoute();

  String get location => GoRouteData.$location(
        '/signup/verified',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
      path: '/onboarding',
      factory: $OnboardingRouteExtension._fromState,
    );

extension $OnboardingRouteExtension on OnboardingRoute {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  String get location => GoRouteData.$location(
        '/onboarding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

RouteBase get $profileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProfileRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'basic-info-setting',
          factory: $BasicInfoSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'religion-preference-setting',
          factory: $ReligionPreferencesSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'theme-setting',
          factory: $ThemeSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'notification-setting',
          factory: $NotificationSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'feedback-and-report',
          factory: $FeedbackAndReportSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'help-and-faqs',
          factory: $HelpAndFAQsSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'terms-of-use',
          factory: $TermsOfUseSettingRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'privacy-policy',
          factory: $PrivacyPolicySettingRouteExtension._fromState,
        ),
      ],
    );

extension $BasicInfoSettingRouteExtension on BasicInfoSettingRoute {
  static BasicInfoSettingRoute _fromState(GoRouterState state) =>
      const BasicInfoSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/basic-info-setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReligionPreferencesSettingRouteExtension
    on ReligionPreferencesSettingRoute {
  static ReligionPreferencesSettingRoute _fromState(GoRouterState state) =>
      const ReligionPreferencesSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/religion-preference-setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThemeSettingRouteExtension on ThemeSettingRoute {
  static ThemeSettingRoute _fromState(GoRouterState state) =>
      const ThemeSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/theme-setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationSettingRouteExtension on NotificationSettingRoute {
  static NotificationSettingRoute _fromState(GoRouterState state) =>
      const NotificationSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/notification-setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FeedbackAndReportSettingRouteExtension
    on FeedbackAndReportSettingRoute {
  static FeedbackAndReportSettingRoute _fromState(GoRouterState state) =>
      const FeedbackAndReportSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/feedback-and-report',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelpAndFAQsSettingRouteExtension on HelpAndFAQsSettingRoute {
  static HelpAndFAQsSettingRoute _fromState(GoRouterState state) =>
      const HelpAndFAQsSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/help-and-faqs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TermsOfUseSettingRouteExtension on TermsOfUseSettingRoute {
  static TermsOfUseSettingRoute _fromState(GoRouterState state) =>
      const TermsOfUseSettingRoute();

  String get location => GoRouteData.$location(
        '/profile/terms-of-use',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PrivacyPolicySettingRouteExtension on PrivacyPolicySettingRoute {
  static PrivacyPolicySettingRoute _fromState(GoRouterState state) =>
      const PrivacyPolicySettingRoute();

  String get location => GoRouteData.$location(
        '/profile/privacy-policy',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
