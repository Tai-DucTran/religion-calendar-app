import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearFirstSectionRatio {
  const LinearFirstSectionRatio._(this.ratio, this.alignment);

  final double ratio;
  final Alignment alignment;

  static final defaultSized = LinearFirstSectionRatio._(
    3 / 10,
    Alignment(0.0, -0.95.w),
  );
  static final halfSized = LinearFirstSectionRatio._(
    1 / 2,
    Alignment(0.0, -0.95.w),
  );
  static final bigSized = LinearFirstSectionRatio._(
    3 / 5,
    Alignment(0.0, -0.85.w),
  );

  Alignment get beginAlignment => alignment;
}
