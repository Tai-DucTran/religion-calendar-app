import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class LoadingOverlayContainer extends StatelessWidget {
  const LoadingOverlayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.black38,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          alignment: Alignment.center,
          width: screenWidth * 0.5,
          height: screenWidth * 0.5,
          child: Center(
            child: Lottie.asset(
              Animations.calendarAnimation,
            ),
          ),
        ),
      ),
    );
  }
}
