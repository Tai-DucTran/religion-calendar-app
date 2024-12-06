import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerLine extends StatelessWidget {
  const BannerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 40.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: AriesColor.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ),
    );
  }
}