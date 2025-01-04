import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReligionLocationCard extends StatelessWidget {
  const ReligionLocationCard({
    super.key,
    required this.title,
    required this.location,
    required this.prayTime,
    required this.img,
  });

  final String title;
  final String location;
  final String prayTime;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AriesColor.neutral0,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AriesColor.yellowP600.withValues(
              alpha: 0.1,
            ),
            offset: const Offset(0, 2),
            blurRadius: 13.4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 120.h,
              maxWidth: 80.w,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(img),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AriesTextStyles.textBodyMedium,
                ),
                Spacing.sp4,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                    ),
                    Spacing.sp4,
                    Expanded(
                      child: Text(
                        location,
                        style: AriesTextStyles.textBodySmall,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.access_time_sharp,
                      size: 16,
                    ),
                    Spacing.sp4,
                    Expanded(
                      child: Text(
                        'Chúa nhật: $prayTime',
                        style: AriesTextStyles.textBodySmall,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
