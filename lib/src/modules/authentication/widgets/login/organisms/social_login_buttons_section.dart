import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/authentication/widgets/login/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/authentication/widgets/login/molecules/molecules.dart';

class SocialLoginButtonsSection extends HookConsumerWidget {
  const SocialLoginButtonsSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authStateControllerProvider.notifier);
    return Column(
      children: [
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
                await controller.loginWithGoogle();
              },
            ),
            Spacing.sp12,
            SocialLoginButton(
              iconPath: AriesIcons.facebookIcon,
              onTap: () async {
                await controller.loginWithFacebook();
              },
            ),
            Spacing.sp12,
            SocialLoginButton(
              iconPath: AriesIcons.appleIcon,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
