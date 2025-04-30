import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:religion_calendar_app/src/widgets/animations/animations.dart';

class LoadingAnimatorContainer extends StatelessWidget {
  const LoadingAnimatorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: 50.h,
        ),
        alignment: Alignment.center,
        width: screenWidth * 0.4,
        height: screenWidth * 0.4,
        child: Center(
          child: Lottie.asset(
            Animations.sunRaiseAnimation,
          ),
        ),
      ),
    );
  }
}
