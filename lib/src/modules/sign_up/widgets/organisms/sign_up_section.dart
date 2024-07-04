import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/molecules/molecules.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpFormFields(),
        Spacing.sp24,
        const Text(
          'or',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacing.sp24,
        const SocialLoginButtonsWrapper(),
        Spacing.sp24,
        LoginOrSignupBottomText(
          initialQuestion: "Already a member? ",
          textSpan: 'Log In',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
