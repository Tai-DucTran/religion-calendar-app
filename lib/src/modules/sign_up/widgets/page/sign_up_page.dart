import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/organisms/organisms.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;

    return HalfLinearContainer(
      isShowKeyboard: isShowKeyboard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacing.sp24,
          SignUpSection(
            isShowKeyboard: isShowKeyboard,
          ),
        ],
      ),
    );
  }
}
