import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/login/organisms/organisms.dart';

import '../../essential_widgets/essential_widgets.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 54),
              child: SvgPicture.asset(AriesImages.sunAndMoonImage),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const Alignment(0.0, -0.95),
                      end: Alignment.bottomCenter,
                      colors: [
                        AriesColor.neutral0.withOpacity(0),
                        AriesColor.neutral0,
                      ],
                      stops: const [
                        0,
                        0.1
                      ]),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                    Spacing.sp24,
                    SocialLoginButtonsSection(),
                    Spacing.sp24,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
