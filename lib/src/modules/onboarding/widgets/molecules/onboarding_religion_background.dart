import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/src/modules/onboarding/controllers/controllers.dart';

class OnboardingReligionBackground extends ConsumerWidget {
  const OnboardingReligionBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReligionBackground =
        ref.watch(selectedReligionBackgroundProvider);
    return Expanded(
      child: SvgPicture.asset(
        selectedReligionBackground,
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
