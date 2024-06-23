import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      title: 'Email',
      keyboardType: TextInputType.emailAddress,
      hintText: 'Insert your email',
      obscureText: false,
      controller: widget.controller,
    );
  }
}
