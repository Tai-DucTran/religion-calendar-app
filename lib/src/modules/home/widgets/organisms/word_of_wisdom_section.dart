import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordOfWisdomSection extends StatelessWidget {
  const WordOfWisdomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 32.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: AriesColor.black,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(AriesImages.defaultQuoteBackgroundImages),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Word of Wisdom',
            style: AriesTextStyles.textHeading6.copyWith(
              color: AriesColor.yellowP200,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Spacing.sp16,
          Text(
            'Be kind, for everyone you meet is fighting a hard battle,',
            style: AriesTextStyles.textHeading5.copyWith(
              color: AriesColor.neutral0,
            ),
            textAlign: TextAlign.center,
          ),
          Spacing.sp16,
          Text(
            'Socriates',
            style: AriesTextStyles.textBodySmall.copyWith(
              color: AriesColor.neutral0,
            ),
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
