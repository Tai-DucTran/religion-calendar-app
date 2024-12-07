// custom_snackbar.dart
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackbarType {
  success,
  warning,
  error,
}

SnackBar getCustomSnackbar({
  required String message,
  required SnackbarType snackbarType,
  required BuildContext context,
}) {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),
    content: Center(
      child: Text(
        message,
        style: TextStyle(
          color: switch (snackbarType) {
            SnackbarType.success => AriesColor.success100,
            SnackbarType.warning => AriesColor.warning100,
            SnackbarType.error => AriesColor.danger100,
          },
        ),
      ),
    ),
    backgroundColor: AriesColor.neutral900,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(
      seconds: 2,
    ),
  );
}
