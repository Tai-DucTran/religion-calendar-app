import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

import '../../../authentication/authentication.dart';

class LoginFormFields extends StatefulHookConsumerWidget {
  const LoginFormFields({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginFormFieldsState();
}

class _LoginFormFieldsState extends ConsumerState<LoginFormFields> {
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
            buttonText: 'Login',
            onPressed: () async {
              final authController =
                  ref.read(authStateControllerProvider.notifier);
              await authController.loginWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
