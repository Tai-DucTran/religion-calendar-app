import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/widgets/text_field/text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return ObscureTextField(
      title: LocalizedKeys.passWord,
      hintText: LocalizedKeys.enterYourPassword,
      controller: widget.controller,
    );
  }
}
