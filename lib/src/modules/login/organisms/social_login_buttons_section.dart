import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/login/molecules/molecules.dart';

class SocialLoginButtonsSection extends HookConsumerWidget {
  const SocialLoginButtonsSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authStateControllerProvider.notifier);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLoginButton(
              iconPath: AriesIcons.googleIcon,
              onTap: () async {
                await controller.loginWithGoogle();
              },
            ),
            Spacing.sp12,
            SocialLoginButton(
              iconPath: AriesIcons.facebookWhiteIcon,
              backgroundColor: AriesColor.facebookColor,
              borderColor: AriesColor.facebookColor,
              onTap: () async {
                await controller.loginWithFacebook();
              },
            ),
            Spacing.sp12,
            SocialLoginButton(
              iconPath: AriesIcons.appleWhiteIcon,
              backgroundColor: AriesColor.black,
              borderColor: AriesColor.black,
              onTap: () {},
            ),
          ],
        ),
        Spacing.sp24,
        const Text(
          'or',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldContainer(
                title: 'Email',
                keyboardType: TextInputType.emailAddress,
                hintText: 'Insert your email',
                obscureText: false,
              ),
              Spacing.sp16,
              TextFieldContainer(
                title: 'Password',
                hintText: 'Insert your password',
                obscureText: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
