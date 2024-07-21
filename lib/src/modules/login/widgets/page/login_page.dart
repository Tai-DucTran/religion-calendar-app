import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/organisms/organisms.dart';

import 'package:religion_calendar_app/src/widgets/widgets.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;

    return HalfLinearContainer(
      isShowKeyboard: isShowKeyboard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacing.sp24,
          LoginSection(
            isShowKeyboard: isShowKeyboard,
          ),
        ],
      ),
    );
  }
}
