import 'package:aries/aries.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:religion_calendar_app/l10n/app_localizations.dart';
import 'package:religion_calendar_app/src/modules/feedback_by_screenshot/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_by_screenshot/widgets/page/page.dart';
import '../src/modules/authentication/authentication.dart';
import '../src/modules/geoip_and_locales/controllers/controllers.dart';
import '../src/modules/user/user.dart';
import '../src/router/router_provider.dart';
import '../src/widgets/widgets.dart';

void runMainApp({
  required String flavor,
  required FirebaseOptions firebaseOptions,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  await ScreenUtil.ensureScreenSize();

  runApp(
    const ProviderScope(
      child: ReligionApp(),
    ),
  );
}

class ReligionApp extends StatefulHookConsumerWidget {
  const ReligionApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReligionAppState();
}

class _ReligionAppState extends ConsumerState<ReligionApp> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateControllerProvider);
    final userState = ref.watch(userControllerProvider);
    final router = ref.watch(routerProvider);
    final currentLocale = ref.watch(localeControllerProvider);
    ref.watch(screenshotDetectionControllerProvider);
    final isFeedbackEnabled = ref.watch(
      screenshotFeedbackFormControllerProvider,
    );

    return BetterFeedback(
      theme: FeedbackThemeData(
        background: Colors.grey,
        feedbackSheetColor: Colors.grey[50]!,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      darkTheme: FeedbackThemeData.dark(),
      localizationsDelegates: [
        GlobalFeedbackLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.localizationsDelegates.first,
      ],
      localeOverride: currentLocale,
      mode: FeedbackMode.draw,
      pixelRatio: 1,
      feedbackBuilder: isFeedbackEnabled
          ? (context, onSubmit, scrollController) {
              return ScreenshotFeedbackForm(
                onSubmit: onSubmit,
                scrollController: scrollController,
              );
            }
          : null,
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Religion App',
        theme: ThemeData(
          primaryColor: AriesColor.yellowP950,
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: currentLocale,
        builder: (ctx, child) {
          ScreenUtil.init(ctx);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.15),
            ),
            child: Stack(
              children: [
                if (child != null) child,
                if (authState is AsyncLoading || userState is AsyncLoading)
                  const LoadingOverlayContainer()
              ],
            ),
          );
        },
      ),
    );
  }
}
