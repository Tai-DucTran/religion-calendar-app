import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({
    super.key,
    this.controller,
    this.isValidEmail,
  });

  final TextEditingController? controller;
  final bool? isValidEmail;

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormFieldContainer(
      title: LocalizedKeys.email,
      keyboardType: TextInputType.emailAddress,
      hintText: LocalizedKeys.enterYourEmail,
      obscureText: false,
      controller: widget.controller,
      suffixIcon: widget.isValidEmail == true
          ? null
          : IconButton(
              iconSize: 16,
              icon: SvgPicture.asset(
                AriesIcons.warningCircleOutlineIcon,
              ),
              onPressed: () {},
            ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocalizedKeys.enterYourEmailHint;
        }
        if (!emailRegex.hasMatch(value)) {
          return LocalizedKeys.invalidEmailText;
        }
        return null;
      },
    );
  }
}
