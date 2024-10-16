import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class WordOfWisdomSection extends StatelessWidget {
  const WordOfWisdomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: AriesColor.neutral0,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -150.h,
            child: Opacity(
              opacity: 0.3,
              child: SvgPicture.asset(
                AriesIcons.wordOfWisdomOutlineIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacing.sp32,
              Text(
                LocalizedKeys.wordOfWisdom,
                style: AriesTextStyles.textHeading6.copyWith(
                  color: AriesColor.neutral100,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Spacing.sp16,
              Text(
                'Be kind, for everyone you meet is fighting a hard battle',
                style: AriesTextStyles.textHeading5.copyWith(
                  color: AriesColor.yellowP400,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
              Spacing.sp16,
              Text(
                'Socrates',
                style: AriesTextStyles.textBodySmall.copyWith(
                  color: AriesColor.black,
                ),
                textAlign: TextAlign.right,
              ),
              Spacing.sp20,
            ],
          ),
        ],
      ),
    );
  }
}
