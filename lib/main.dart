import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'src/modules/authentication/authentication.dart';
import 'src/modules/router/router_provider.dart';
import 'src/widgets/widgets.dart';

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
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            if (authState is AsyncLoading) const LoadingOverlayContainer()
          ],
        );
      },
    );
  }
}
