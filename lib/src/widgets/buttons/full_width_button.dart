import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/widgets/buttons/buttons.dart';

class FullWidthButton extends HookConsumerWidget {
  const FullWidthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomElevatedButton(
      text: 'Back',
      width: double.infinity,
      buttonColor: AriesColor.neutral10,
      onPressed: onPressed,
    );
  }
}
