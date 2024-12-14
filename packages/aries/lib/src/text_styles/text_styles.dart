import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AriesTextStyles {
  AriesTextStyles._(); // Private constructor to prevent instantiation

  // Display 1: Extra Light, 48px, 1.3 x font size
  static TextStyle get textDisplay1 => TextStyle(
        fontWeight: FontWeight.w200, // Extra Light
        fontSize: 48.sp,
        overflow: TextOverflow.ellipsis,
      );

  // Display 2: Extra Light, 40px, 1.3 x font size
  static TextStyle get textDisplay2 => TextStyle(
        fontWeight: FontWeight.w200, // Extra Light
        fontSize: 40.sp,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 1: Bold, 44px, 1.3 x font size
  static TextStyle get textHeading1 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 42.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral800,
      );

  // Heading 2: Bold, 36px, 1.3 x font size
  static TextStyle get textHeading2 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral800,
      );

  // Heading 3: Bold, 28px, 1.3 x font size
  static TextStyle get textHeading3 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral800,
      );

  // Heading 4: Bold, 24px, 1.3 x font size
  static TextStyle get textHeading4 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral800,
      );

  // Heading 5: Bold, 20px, 1.3 x font size
  static TextStyle get textHeading5 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral700,
      );

  // Heading 6: Bold, 16px, 1.3 x font size
  static TextStyle get textHeading6 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral700,
      );

  // Lead Paragraph: Regular, 22px, 1.5 x font size
  static TextStyle get textLeadParagraph => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 22.sp,
        height: 1.5.h,
        overflow: TextOverflow.ellipsis,
      );

  // Body Large: Regular / Semibold, 20px, 1.7 x font size
  static TextStyle get textBodyLarge => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 20.sp,
        overflow: TextOverflow.ellipsis,
      );

  // Body Medium: Regular / Semibold, 18px, 1.7 x font size
  static TextStyle get textBodyMedium => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 16.sp,
        overflow: TextOverflow.ellipsis,
      );

  // Body Normal: Regular / Semibold, 16px, 1.7 x font size
  static TextStyle get textBodyNormal => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 14.sp,
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral700,
      );

  // Body Small: Regular / Semibold, 14px, 1.7 x font size
  static TextStyle get textBodySmall => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
      );

  /// This textStyle formats are used in [EventPageModalBottomSheet] widget
  //* Hint Text Field style:
  static TextStyle get textHintTextField => TextStyle(
        overflow: TextOverflow.ellipsis,
        color: AriesColor.neutral60,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      );

  //* Text Input Field style:
  static TextStyle get textInputField => TextStyle(
        overflow: TextOverflow.ellipsis,
        color: AriesColor.yellowP950,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      );
}
