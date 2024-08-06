import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/login/widgets/page/login_page.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class VerifiedPage extends ConsumerWidget {
  const VerifiedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatorRepositoryProvider).currentUser;

    return HalfLinearContainer(
      firstSectionRatio: LinearFirstSectionRatio.halfSized,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verified Email',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacing.sp24,
          const Text(
            textAlign: TextAlign.center,
            "We've sent you an email verification. Please open it to verify your account.",
            style: TextStyle(
              color: AriesColor.neutral900,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacing.sp24,
          CtaFullWidthButton(
            buttonText: 'Resend Verified Email',
            onPressed: () async {
              final authProvider = ref.read(authenticatorRepositoryProvider);
              await authProvider.sendEmailVerification(user);
            },
          ),
          Spacing.sp24,
          CtaFullWidthButton(
            buttonColor: AriesColor.neutral30,
            buttonText: 'Back To Sign-in',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
