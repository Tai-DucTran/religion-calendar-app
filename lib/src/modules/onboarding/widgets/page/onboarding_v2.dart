import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            AriesColor.yellowP100,
            AriesColor.yellowP100,
          ],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [const Text('Tôn giáo của bạn là')],
      ),
    );
  }
}
