import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/widgets.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class ReligionPreferenceOnboarding extends StatelessWidget {
  const ReligionPreferenceOnboarding({
    super.key,
    this.isProfilePageSetting = false,
  });

  final bool isProfilePageSetting;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AriesColor.yellowP50,
            AriesColor.yellowP200,
          ],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                context.l10n.myReligionIs,
                style: AriesTextStyles.textHeading3.copyWith(
                  fontSize: 26,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
              Spacing.sp24,
              const ExpandableReligionButtonsSection(),
            ],
          ),
          const OnboardingReligionBackground(),
          CompleteButton(isProfilePageSetting),
        ],
      ),
    );
  }
}
