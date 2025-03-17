import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

class ExpandableButtonsSection extends StatefulWidget {
  const ExpandableButtonsSection({super.key});

  @override
  State<ExpandableButtonsSection> createState() =>
      _ExpandableButtonsSectionState();
}

class _ExpandableButtonsSectionState extends State<ExpandableButtonsSection> {
  int _selectedIndex = 0;

  void _onButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
