import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/widgets/buttons/buttons.dart';

class CtaFullWidthButton extends HookConsumerWidget {
  const CtaFullWidthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomElevatedButton(
      text: buttonText,
      width: double.infinity,
      buttonColor: buttonColor ?? AriesColor.yellowP300,
      onPressed: onPressed,
    );
  }
}
