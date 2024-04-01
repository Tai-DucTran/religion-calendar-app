import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/custom_elevated_button.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/molecules/social_login_button.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/atoms/text_between_dividers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                text: 'Go anonymous',
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
                  SocialLoginButton(
                    iconPath: AriesIcons.googleIcon,
                    onTap: () {},
                  ),
                  Spacing.sp12,
                  SocialLoginButton(
                    iconPath: AriesIcons.facebookIcon,
                    onTap: () {},
                  ),
                  Spacing.sp12,
                  SocialLoginButton(
                    iconPath: AriesIcons.appleIcon,
                    onTap: () {},
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
