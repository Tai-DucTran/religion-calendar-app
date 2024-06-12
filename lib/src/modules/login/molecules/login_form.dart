import 'package:aries/aries.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
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
            text: 'Sign in',
            width: double.infinity,
            buttonColor: AriesColor.yellowP300,
            onPressed: () {},
          ),
          Spacing.sp8,
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: AriesColor.yellowP300,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          Spacing.sp4,
          Container(
            padding: const EdgeInsets.only(top: 18),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    color: AriesColor.neutral900,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        color: AriesColor.yellowP300,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Sign up tapped!');
                        },
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
