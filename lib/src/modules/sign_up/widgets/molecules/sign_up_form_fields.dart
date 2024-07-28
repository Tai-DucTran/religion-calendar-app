import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class SignUpFormFields extends ConsumerStatefulWidget {
  const SignUpFormFields({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends ConsumerState<SignUpFormFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text.log();
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailTextField(
            controller: _emailController,
          ),
          Spacing.sp16,
          PasswordTextField(
            controller: _passwordController,
          ),
          Spacing.sp24,
          CtaFullWidthButton(
            buttonText: 'Sign Up',
            onPressed: () async {
              final authController =
                  ref.read(authStateControllerProvider.notifier);
              await authController.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
            },
          ),
          Spacing.sp8,
        ],
      ),
    );
  }
}
