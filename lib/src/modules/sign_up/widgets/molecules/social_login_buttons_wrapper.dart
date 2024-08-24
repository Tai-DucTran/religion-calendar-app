import 'dart:io' show Platform;
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/helper/helper.dart';
import 'package:religion_calendar_app/src/modules/authentication/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/utils/log.dart';

class SocialLoginButtonsWrapper extends ConsumerWidget {
  const SocialLoginButtonsWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAppleDevices = isAppleOS(Platform.operatingSystem);

    return Column(
      children: [
        isAppleDevices
            ? SocialLoginButton(
                iconPath: AriesIcons.appleWhiteIcon,
                backgroundColor: AriesColor.black,
                borderColor: AriesColor.black,
                isFullWidth: true,
                onTap: () {},
              )
            : SocialLoginButton(
                iconPath: AriesIcons.googleIcon,
                isFullWidth: true,
                onTap: () async {
                  final controller =
                      ref.read(authStateControllerProvider.notifier);
                  await controller.loginWithGoogle();
                },
              ),
        Spacing.sp16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SocialLoginButton(
              iconPath: AriesIcons.googleIcon,
              onTap: () async {
                final controller =
                    ref.read(authStateControllerProvider.notifier);
                await controller.loginWithGoogle();
              },
            ),
            SocialLoginButton(
              iconPath: AriesIcons.facebookWhiteIcon,
              backgroundColor: AriesColor.facebookColor,
              borderColor: AriesColor.facebookColor,
              onTap: () async {
                final controller =
                    ref.read(authStateControllerProvider.notifier);
                await controller.loginWithFacebook();
              },
            ),
          ],
        ),
      ],
    );
  }
}
