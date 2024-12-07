import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEventButton extends StatelessWidget {
  const EditEventButton({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.w,
      right: 16.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 46.w,
          height: 46.w,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(23.r),
          ),
          child: Icon(
            Icons.edit,
            color: AriesColor.neutral0,
            size: 23.w,
          ),
        ),
      ),
    );
  }
}
