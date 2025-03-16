import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/text_fields/text_fields.dart';

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
    return ObscureTextFormField(
      title: context.l10n.passWord,
      hintText: context.l10n.enterYourPassword,
      controller: widget.controller,
    );
  }
}
