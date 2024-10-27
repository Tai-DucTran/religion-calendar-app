import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/authentication/exceptions/authenticator_exceptions.dart';
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
            EmailTextFormField(
              controller: _emailController,
              isValidEmail: _isEmailValid,
            ),
            Spacing.sp16,
            PasswordTextField(
              controller: _passwordController,
            ),
            Spacing.sp24,
            CtaFullWidthButton(
              buttonText: LocalizedKeys.signUp,
              onPressed: () async {
                setState(() {
                  _isEmailValid = _formKey.currentState!.validate();
                });
                final authController =
                    ref.read(authStateControllerProvider.notifier);
                if (_isEmailValid) {
                  try {
                    await authController.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } catch (e) {
                    if (!mounted) return;
                    if (e is EmailAlreadyInUseAuthException) {
                      if (_emailController.text.contains('gmail')) {
                        _showErrorOverlay(
                          title: LocalizedKeys.emailAlreadyInUseTitle,
                          message: LocalizedKeys.googleEmailAlreadyInUseMessage,
                          isErrorOverlay: false,
                        );
                      } else {
                        _showErrorOverlay(
                          title: LocalizedKeys.emailAlreadyInUseTitle,
                          message: LocalizedKeys.emailAlreadyInUseMessage,
                          isErrorOverlay: false,
                          icon: Icons.mail_outline_rounded,
                        );
                      }
                    } else {
                      _showErrorOverlay(
                        title: 'Error: $e',
                        message: 'An unexpected error occurred.',
                        isErrorOverlay: true,
                      );
                    }
                  }
                }
              },
            ),
            Spacing.sp8,
          ],
        ),
      ),
    );
  }
}
