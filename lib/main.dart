import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/pages/home_page.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/page/page.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'firebase_options.dart';
import 'src/modules/landing/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: ReligionCalendar(),
  ));
}

class ReligionCalendar extends HookConsumerWidget {
  const ReligionCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(true);
    useEffect(() {
      () async {
        Future.delayed(
            const Duration(
              milliseconds: 1500,
            ), () {
          isLoading.value = false;
        });
      }.call();
      return null;
    }, []);

    final authStateController = ref.watch(authStateControllerProvider);

    if (isLoading.value) return const SplashScreenPage();

    return MaterialApp(
      title: 'Religion Calendar App',
      theme: ThemeData(
        primaryColor: AriesColor.yellowP300,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AriesColor.yellowP300,
        ),
        useMaterial3: true,
      ),
      home: authStateController.when(
        data: (data) {
          final authResult = data.result;
          authResult?.log();

          if (authResult == AuthResults.success) {
            return const HomePage();
          }
          return const SignUpPage();
        },
        error: (_, __) => const SignUpPage(),
        loading: () => const SignUpPage(),
      ),
    );
  }
}
