import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ReligionCalendar(),
  );
}

class ReligionCalendar extends StatelessWidget {
  const ReligionCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Religion Calendar App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 56, 90, 128)),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Sign In Page'),
    );
  }
}
