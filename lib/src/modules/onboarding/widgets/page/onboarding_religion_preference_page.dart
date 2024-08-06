import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/helper/string_helper.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/get_religion_onboarding_image_controller.dart';
import 'package:religion_calendar_app/src/modules/router/routes.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/repositories/user_firestore_repo.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class OnboardingReligionPreferencePage extends ConsumerWidget {
  const OnboardingReligionPreferencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(selectedReligionProvider);
    final currentReligionPref =
        ref.watch(currentReligionProvider.notifier).state.name.toUpperCase();
    final userId = ref.watch(authenticatorRepositoryProvider).currentUser?.uid;

    currentReligionPref.log();
    userId?.log();

    return HalfLinearContainer(
      imagePath: imagePath,
      firstSectionRatio: LinearFirstSectionRatio.halfSized,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Religion',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'What is your religion?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              itemCount: ReligionPreference.values.length,
              itemBuilder: (context, index) {
                final religion = ReligionPreference.values[index];
                final isSelected =
                    religion == ref.watch(currentReligionProvider);
                final color =
                    isSelected ? AriesColor.yellowP600 : AriesColor.neutral300;
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  title: Text(
                    religion.name.toCapitalized(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                  horizontalTitleGap: 4,
                  dense: true,
                  trailing: isSelected
                      ? Icon(
                          Icons.check,
                          color: color,
                        )
                      : null,
                  // TODO (Tai): Implement save user religion on fir
                  onTap: () {
                    ref.read(currentReligionProvider.notifier).state = religion;
                  },
                );
              },
            ),
            CtaFullWidthButton(
              buttonText: 'Select',
              onPressed: () async {
                final userFirestoreController =
                    ref.read(userFirestoreRepositoryProvider);
                userFirestoreController.updateReligionPreferenceOnboarding(
                  userId: userId,
                  religionPreference: currentReligionPref,
                );
                ref
                    .read(authStateControllerProvider.notifier)
                    .updateOnboardingStatus(true);
                context.go(const HomeRoute().location);
              },
            ),
            // TODO (Tai): Implement submit request form
            Spacing.sp24,
            BottomRichTextWithAction(
              initialQuestion: 'You want to have your religion? ',
              textSpan: 'Submit here',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
