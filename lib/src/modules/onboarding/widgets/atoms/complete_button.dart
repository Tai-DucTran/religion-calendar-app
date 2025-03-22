import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/repositories.dart';
import 'package:religion_calendar_app/src/router/routes.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CompleteButton extends ConsumerWidget {
  const CompleteButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authenticatorRepositoryProvider).currentUser?.uid;
    final currentReligionPref = ref.watch(currentReligionProvider);

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 40.0,
        ),
        child: CustomElevatedButton(
          text: context.l10n.completeButtonText,
          onPressed: () async {
            final userFirestoreController =
                ref.read(userFirestoreRepositoryProvider);
            userFirestoreController.updateReligionPreferenceOnboarding(
              userId: userId,
              religionPreference:
                  currentReligionPref.name.toString().toUpperCase(),
            );
            ref
                .read(authStateControllerProvider.notifier)
                .updateOnboardingStatus(true);
            context.go(HomeRoute().location);
          },
          textStyle: TextStyle(
            color: Colors.white,
          ),
          buttonColor: AriesColor.yellowP950,
        ),
      ),
    );
  }
}
