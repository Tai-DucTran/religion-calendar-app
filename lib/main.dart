import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aries/aries.dart';
import 'package:religion_calendar_app/src/widgets/custom_elevated_button.dart';
import 'package:religion_calendar_app/src/widgets/text_between_dividers.dart';

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
      home: const HomePage(title: 'Sign In Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomElevatedButton(
                text: 'Sign In',
                onPressed: () {},
                marginHorizontal: 30,
                buttonColor: Colors.blue[400],
                textColor: Colors.white,
              ),
              Spacing.sp12,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 80),
                child: TextBetweenDividers(
                  text: 'or continue with',
                  dividerColor: Colors.grey[400],
                  textColor: Colors.grey[600],
                ),
              ),
              Spacing.sp12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AriesIcons.googleIcon,
                    height: 50,
                    width: 50,
                  ),
                  Spacing.sp12,
                  SvgPicture.asset(
                    AriesIcons.facebookIcon,
                    height: 50,
                    width: 50,
                  ),
                  Spacing.sp12,
                  SvgPicture.asset(
                    AriesIcons.appleIcon,
                    height: 50,
                    width: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
