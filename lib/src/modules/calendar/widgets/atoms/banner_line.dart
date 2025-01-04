import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerLine extends StatelessWidget {
  const BannerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.w,
      ),
      child: Center(
        child: Container(
          width: 40.w,
          height: 5.w,
          decoration: BoxDecoration(
            color: AriesColor.black.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ),
    );
  }
}
