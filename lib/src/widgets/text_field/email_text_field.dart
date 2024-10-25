import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    this.controller,
    this.isValidEmail,
  });

  final TextEditingController? controller;
  final bool? isValidEmail;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
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
        value?.log();
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
