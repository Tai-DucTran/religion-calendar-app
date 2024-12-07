import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constants.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    this.img,
  });

  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Image.network(
        img ?? FirebaseImage.defaultBannerImage,
        width: double.infinity,
        fit: BoxFit.cover,
        height: 150.w,
      ),
    );
  }
}
