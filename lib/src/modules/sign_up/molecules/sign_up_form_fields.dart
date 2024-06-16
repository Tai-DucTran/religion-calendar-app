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
          const TextFieldContainer(
            title: 'Email',
            keyboardType: TextInputType.emailAddress,
            hintText: 'Insert your email',
            obscureText: false,
          ),
          Spacing.sp16,
          const ObscureTextFieldContainer(
            title: 'Password',
            hintText: 'Insert your password',
          ),
          Spacing.sp24,
          CustomElevatedButton(
            text: 'Sign Up',
            width: double.infinity,
            buttonColor: AriesColor.yellowP300,
            onPressed: () {},
          ),
          Spacing.sp8,
        ],
      ),
    );
  }
}
