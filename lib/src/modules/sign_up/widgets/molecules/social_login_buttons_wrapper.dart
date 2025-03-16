import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/atoms/atoms.dart';

class SocialLoginButtonsWrapper extends ConsumerWidget {
  const SocialLoginButtonsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAppleDevice = Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.macOS;

    return SizedBox(
      width: double.infinity,
      child: isAppleDevice
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton(
                  iconPath: AriesIcons.googleIcon,
                  onTap: () async {
                    final controller =
                        ref.read(authStateControllerProvider.notifier);
                    await controller.loginWithGoogle();
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
            )
          : SizedBox(
              width: double.infinity,
              child: SocialLoginButton(
                iconPath: AriesIcons.googleIcon,
                onTap: () async {
                  final controller =
                      ref.read(authStateControllerProvider.notifier);
                  await controller.loginWithGoogle();
                },
              ),
            ),
    );
  }
}
