import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void _showAccountExistsMessage() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewInsets.top + 80,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have already used this email!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'This email is associated with a Google account that has been previously logged in. Please log in with Google to continue.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
              buttonText: 'Sign Up',
              onPressed: () async {
                setState(() {
                  _isEmailValid = _formKey.currentState!.validate();
                });
                if (_isEmailValid) {
                  final authController =
                      ref.read(authStateControllerProvider.notifier);
                  try {
                    await authController.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } catch (e) {
                    if (!mounted) return;
                    if (e is EmailAlreadyInUseAuthException) {
                      _showAccountExistsMessage();
                    } else {
                      _showAccountExistsMessage();
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
