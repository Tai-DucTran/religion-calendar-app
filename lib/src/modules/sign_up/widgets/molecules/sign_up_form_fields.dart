import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class SignUpFormFields extends StatefulWidget {
  const SignUpFormFields({super.key});

  @override
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EmailTextField(),
          Spacing.sp16,
          const PasswordTextField(),
          Spacing.sp24,
          CtaFullWidthButton(
            buttonText: 'Sign Up',
            onPressed: () {},
          ),
          Spacing.sp8,
        ],
      ),
    );
  }
}
