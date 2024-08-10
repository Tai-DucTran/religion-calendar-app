import 'package:flutter/material.dart';

class GradientAppMainBackground extends StatelessWidget {
  const GradientAppMainBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF), // #FFFFFF
            Color(0xFFFAF5E9), // #FAF5E9
            Color(0xFFF1E6C7), // #F1E6C7
          ],
          stops: [0.0, 0.695, 1.0],
        ),
      ),
    );
  }
}
