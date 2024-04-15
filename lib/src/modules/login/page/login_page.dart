import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/widgets/custom_elevated_button.dart';
import 'package:religion_calendar_app/src/modules/login/molecules/social_login_button.dart';
import 'package:religion_calendar_app/src/modules/login/atoms/text_between_dividers.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(authStateControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
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
                    onTap: () async {
                      controller.loginWithGoogle();
                    },
                  ),
                  Spacing.sp12,
                  SocialLoginButton(
                    iconPath: AriesIcons.facebookIcon,
                    onTap: () async {},
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
