import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/onboarding/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

class ExpandableReligionButtonsSection extends ConsumerWidget {
  const ExpandableReligionButtonsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReligion = ref.watch(currentReligionProvider);
    void onButtonTap(ReligionPreference religion) {
      ref.read(currentReligionProvider.notifier).state = religion;
    }

    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExpandableButton(
          iconPath: AriesIcons.catholicIcon,
          text: ReligionPreference.catholicism.getLocalized(context),
          isExpanded: selectedReligion == ReligionPreference.catholicism,
          onTap: () => onButtonTap(ReligionPreference.catholicism),
        ),
        ExpandableButton(
          iconPath: AriesIcons.buddaIcon,
          text: ReligionPreference.buddhism.getLocalized(context),
          isExpanded: selectedReligion == ReligionPreference.buddhism,
          onTap: () => onButtonTap(ReligionPreference.buddhism),
        ),
        ExpandableButton(
          iconPath: AriesIcons.heartCircleIcon,
          text: ReligionPreference.unknown.getLocalized(context),
          isExpanded: selectedReligion == ReligionPreference.unknown,
          onTap: () => onButtonTap(ReligionPreference.unknown),
        ),
      ],
    );
  }
}
