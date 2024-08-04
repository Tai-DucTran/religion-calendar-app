import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/exceptions/authenticator_exceptions.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

import '../../../authentication/authentication.dart';

class LoginFormFields extends ConsumerStatefulWidget {
  const LoginFormFields({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginFormFieldsState();
}

class _LoginFormFieldsState extends ConsumerState<LoginFormFields> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  OverlayEntry? overlayEntry;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    cleanOverlayEntry();
    super.dispose();
  }

  void cleanOverlayEntry() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  void _showErrorOverlay({
    required String title,
    required String message,
    required bool isErrorOverlay,
    IconData? icon,
  }) {
    cleanOverlayEntry();

    overlayEntry = OverlayEntry(
      builder: (context) => ErrorOverlayTopModal(
        errorTitle: title,
        errorMessage: message,
        onClose: cleanOverlayEntry,
        isErrorOverlay: isErrorOverlay,
        icon: icon,
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextField(
              controller: _emailController,
              isValidEmail: _isEmailValid,
            ),
            Spacing.sp16,
            PasswordTextField(
              controller: _passwordController,
            ),
            Spacing.sp24,
            CtaFullWidthButton(
              buttonText: 'Login',
              onPressed: () async {
                setState(() {
                  _isEmailValid = _formKey.currentState!.validate();
                });
                final authController =
                    ref.read(authStateControllerProvider.notifier);
                try {
                  await authController.loginWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } catch (error) {
                  if (!mounted) return;
                  if (error is InvalidCredentialAuthException) {
                    _showErrorOverlay(
                      title: 'Invalid Credential',
                      message:
                          'Your email or password is incorrect, please try again',
                      isErrorOverlay: true,
                    );
                  } else if (error is WrongPasswordAuthException) {
                    _showErrorOverlay(
                      title: 'Wrong Password',
                      message: 'Your password is incorrect, please try again',
                      isErrorOverlay: true,
                    );
                  } else if (error is UserNotFoundAuthException) {
                    _showErrorOverlay(
                      title: 'Account Not Found',
                      message: 'We cannot find your account, please try again!',
                      isErrorOverlay: true,
                    );
                  } else {
                    _showErrorOverlay(
                      title: 'Error: $error',
                      message: 'An unexpected error occurred.',
                      isErrorOverlay: true,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
