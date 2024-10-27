import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ForgotPaswordPage extends HookConsumerWidget {
  const ForgotPaswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HalfLinearContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacing.sp24,
          const EmailTextFormField(),
          Spacing.sp24,
          CtaFullWidthButton(
            buttonText: 'Reset Password',
            onPressed: () {},
          ),
          Spacing.sp12,
          FullWidthButton(
            buttonText: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
