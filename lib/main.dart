import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'firebase_options.dart';
import 'src/modules/authentication/authentication.dart';
import 'src/router/router_provider.dart';
import 'src/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  runApp(const ProviderScope(
    child: ReligionCalendar(),
  ));
}

class ReligionCalendar extends HookConsumerWidget {
  const ReligionCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateControllerProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Religion Calendar App',
      theme: ThemeData(
        primaryColor: AriesColor.yellowP300,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AriesColor.yellowP300,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
              if (authState is AsyncLoading) const LoadingOverlayContainer()
            ],
          ),
        );
      },
    );
  }
}
