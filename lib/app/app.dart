import 'package:aries/aries.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import '../src/modules/authentication/authentication.dart';
import '../src/modules/geoip_and_locales/controllers/controllers.dart';
import '../src/modules/user/user.dart';
import '../src/router/router_provider.dart';
import '../src/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: ReligionCalendar(),
    ),
  );
}

class ReligionCalendar extends HookConsumerWidget {
  const ReligionCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateControllerProvider);
    final userState = ref.watch(userControllerProvider);
    final router = ref.watch(routerProvider);
    final currentLocale = ref.watch(localeControllerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Religion Calendar App',
      theme: ThemeData(
        primaryColor: AriesColor.yellowP950,
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: currentLocale,
      builder: (ctx, child) {
        LocalizedKeys.setContext(ctx);
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
    );
  }
}
