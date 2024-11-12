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
      decoration: BoxDecoration(
        color: const Color(0xFFfcf7e9).withOpacity(
          0.8,
        ),
      ),
      child: SafeArea(
        key: child.key,
        child: child,
      ),
    );
  }
}
