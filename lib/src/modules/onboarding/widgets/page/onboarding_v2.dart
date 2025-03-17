import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/widgets.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class OnboardingPageV2 extends StatelessWidget {
  const OnboardingPageV2({
    super.key,
  });

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
            AriesColor.yellowP100,
            AriesColor.yellowP200,
          ],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 128,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 42,
              right: 42,
            ),
            child: Text(
              context.l10n.myReligionIs,
              style: AriesTextStyles.textHeading3.copyWith(
                fontSize: 26,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacing.sp32,
          ExpandableButtonsSection(),
        ],
      ),
    );
  }
}
