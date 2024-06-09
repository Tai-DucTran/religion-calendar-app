import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFBF4E0),
            Color(0xFFECCC6F),
            AriesColor.yellowP300,
          ],
          stops: [0.0, 0.0, 0.48, 1],
        ),
      ),
      child: child,
    );
  }
}
