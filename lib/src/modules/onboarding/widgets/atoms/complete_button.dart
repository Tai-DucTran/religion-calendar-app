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
  const CompleteButton(this.isProfilePageSetting, {super.key});
  final bool isProfilePageSetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authenticatorRepositoryProvider).currentUser?.uid;
    final currentReligionPref = ref.watch(currentReligionProvider);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 40.0,
      ),
      child: Row(
        spacing: 8,
        children: [
          if (isProfilePageSetting) ...[
            SizedBox(
              width: 80,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AriesColor.neutral20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: AriesColor.black,
                ),
              ),
            ),
          ],
          Expanded(
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

                if (isProfilePageSetting) {
                  Navigator.of(context).pop(true);
                } else {
                  context.go(HomeRoute().location);
                }
              },
              textStyle: TextStyle(
                color: Colors.white,
              ),
              buttonColor: AriesColor.yellowP950,
            ),
          ),
        ],
      ),
    );
  }
}
