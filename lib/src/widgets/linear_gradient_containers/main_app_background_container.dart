import 'package:flutter/material.dart';

class MainAppBackgroundContainer extends StatelessWidget {
  const MainAppBackgroundContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFAF5E9),
            Color(0xFFF1E6C7),
          ],
          stops: [0.0, 0.695, 1.0],
        ),
      ),
      child: SafeArea(
        key: child.key,
        child: child,
      ),
    );
  }
}
