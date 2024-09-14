import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AriesTextStyles {
  AriesTextStyles._(); // Private constructor to prevent instantiation

  // Display 1: Extra Light, 48px, 1.3 x font size
  static TextStyle get textDisplay1 => TextStyle(
        fontWeight: FontWeight.w200, // Extra Light
        fontSize: 48.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Display 2: Extra Light, 40px, 1.3 x font size
  static TextStyle get textDisplay2 => TextStyle(
        fontWeight: FontWeight.w200, // Extra Light
        fontSize: 40.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 1: Bold, 44px, 1.3 x font size
  static TextStyle get textHeading1 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 44.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 2: Bold, 36px, 1.3 x font size
  static TextStyle get textHeading2 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 3: Bold, 28px, 1.3 x font size
  static TextStyle get textHeading3 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 4: Bold, 24px, 1.3 x font size
  static TextStyle get textHeading4 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 5: Bold, 20px, 1.3 x font size
  static TextStyle get textHeading5 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
      );

  // Heading 6: Bold, 16px, 1.3 x font size
  static TextStyle get textHeading6 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
        height: 1.3.h,
        overflow: TextOverflow.ellipsis,
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
        height: 1.7.h,
        overflow: TextOverflow.ellipsis,
      );

  // Body Medium: Regular / Semibold, 18px, 1.7 x font size
  static TextStyle get textBodyMedium => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 16.sp,
        height: 1.7.h,
        overflow: TextOverflow.ellipsis,
      );

  // Body Normal: Regular / Semibold, 16px, 1.7 x font size
  static TextStyle get textBodyNormal => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 14.sp,
        height: 1.7.h,
        overflow: TextOverflow.ellipsis,
      );

  // Body Small: Regular / Semibold, 14px, 1.7 x font size
  static TextStyle get textBodySmall => TextStyle(
        fontWeight: FontWeight.normal, // Switch to FontWeight.w600 for Semibold
        fontSize: 12.sp,
        height: 1.7.h,
        overflow: TextOverflow.ellipsis,
      );
}
