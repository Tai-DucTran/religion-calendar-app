import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventLocationText extends StatelessWidget {
  const EventLocationText({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Spacing.sp20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AriesColor.neutral70,
              size: 20.h,
            ),
            Spacing.sp8,
            Expanded(
              child: Text(
                location,
                overflow: TextOverflow.visible,
                style: AriesTextStyles.textBodyNormal.copyWith(
                  color: AriesColor.neutral700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
