import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class OnboardingPageV2 extends StatefulWidget {
  const OnboardingPageV2({
    super.key,
  });

  @override
  State<OnboardingPageV2> createState() => _OnboardingPageV2State();
}

class _OnboardingPageV2State extends State<OnboardingPageV2>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            margin: const EdgeInsets.only(left: 42, right: 42),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpandableButton(
                iconPath: AriesIcons.catholicIcon,
                text: ReligionPreference.catholicism.getLocalized(context),
                color: AriesColor.neutral900,
                isExpanded: _selectedIndex == 0,
                onTap: () => _onButtonTap(0),
              ),
              Spacing.sp12,
              ExpandableButton(
                iconPath: AriesIcons.buddaIcon,
                text: ReligionPreference.buddhism.getLocalized(context),
                color: AriesColor.neutral900,
                isExpanded: _selectedIndex == 1,
                onTap: () => _onButtonTap(1),
              ),
              Spacing.sp12,
              ExpandableButton(
                iconPath: AriesIcons.catholicIcon,
                text: ReligionPreference.unknown.getLocalized(context),
                color: AriesColor.neutral900,
                isExpanded: _selectedIndex == 2,
                onTap: () => _onButtonTap(2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
