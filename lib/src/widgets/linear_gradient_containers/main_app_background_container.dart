import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBackgroundContainer extends StatelessWidget {
  const MainAppBackgroundContainer({
    super.key,
    required this.child,
    this.paddingHorizontal,
  });
  final Widget child;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    final selectedPaddingHorizontal = paddingHorizontal ?? 14.h;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
        top: 14.h,
        right: selectedPaddingHorizontal,
        left: selectedPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: AriesColor.yellowP50,
      ),
      child: SafeArea(
        key: child.key,
        child: child,
      ),
    );
  }
}
