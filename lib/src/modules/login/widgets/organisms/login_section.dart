import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/organisms/login_form_field.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/forgot_pasword_page.dart';
import 'package:religion_calendar_app/src/modules/sign_up/sign_up.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class LoginSection extends HookConsumerWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SocialLoginButtonWrapper(),
        Spacing.sp24,
        const Text(
          'or',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacing.sp24,
        const LoginFormFields(),
        Container(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPaswordPage(),
                ),
              );
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: AriesColor.yellowP300,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Spacing.sp24,
        LoginOrSignupBottomText(
          initialQuestion: "Don't have an account? ",
          textSpan: "Sign Up",
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
