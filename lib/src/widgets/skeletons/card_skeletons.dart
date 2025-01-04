import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CardSkeletons extends StatelessWidget {
  const CardSkeletons({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSkeleton(
      child: Container(
        height: 140,
        width: double.infinity,
        color: AriesColor.neutral30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.sp4,
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.w,
                horizontal: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mockLoadingTextContent,
                    style: AriesTextStyles.textHeading5.copyWith(
                      color: AriesColor.neutral900,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        mockLoadingTextContent,
                        style: AriesTextStyles.textBodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacing.sp8,
                      Text(
                        mockLoadingTextContent,
                        style: AriesTextStyles.textBodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child:
                        Text('$mockLoadingTextContent $mockLoadingTextContent'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child:
                        Text('$mockLoadingTextContent $mockLoadingTextContent'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
