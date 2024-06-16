import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/sign_up/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/sign_up/molecules/molecules.dart';

class SignUpSection extends HookConsumerWidget {
  const SignUpSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        SignUpFormFields(),
        Spacing.sp24,
        Text(
          'or',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacing.sp24,
        SocialLoginButtonWrapper(),
        Spacing.sp24,
        AlreadyAMember()
      ],
    );
  }
}
