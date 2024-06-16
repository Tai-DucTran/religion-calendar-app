import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class HalfLinearContainer extends StatelessWidget {
  const HalfLinearContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 54),
              child: SvgPicture.asset(AriesImages.sunAndMoonImage),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const Alignment(0.0, -0.95),
                      end: Alignment.bottomCenter,
                      colors: [
                        AriesColor.neutral0.withOpacity(0),
                        AriesColor.neutral0,
                      ],
                      stops: const [
                        0,
                        0.1
                      ]),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
