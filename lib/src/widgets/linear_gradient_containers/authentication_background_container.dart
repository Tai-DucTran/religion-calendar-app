import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class AuthenticationBackgroundContainer extends StatelessWidget {
  const AuthenticationBackgroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 2),
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFBF4E0),
            Color(0xFFECCC6F),
            AriesColor.yellowP950,
          ],
          stops: [0.0, 0.0, 0.48, 1],
        ),
      ),
      child: child,
    );
  }
}
