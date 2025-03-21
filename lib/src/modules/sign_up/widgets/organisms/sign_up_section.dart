import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:religion_calendar_app/src/modules/sign_up/widgets/molecules/molecules.dart';

import 'package:religion_calendar_app/src/widgets/widgets.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
    this.isShowKeyboard = false,
  });

  final bool isShowKeyboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpFormFields(),
        if (!isShowKeyboard) ...[
          Spacing.sp12,
        ],
        Spacing.sp12,
        Text(
          context.l10n.or,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        if (!isShowKeyboard) ...[
          Spacing.sp12,
        ],
        Spacing.sp12,
        const SocialLoginButtonsWrapper(),
        Spacing.sp24,
        BottomRichTextWithAction(
          initialQuestion: context.l10n.alreadyAMember,
          textSpan: context.l10n.login,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
