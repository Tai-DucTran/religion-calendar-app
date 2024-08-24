import 'package:flutter/material.dart';

class LinearFirstSectionRatio {
  const LinearFirstSectionRatio._(this.ratio, this.alignment);

  final double ratio;
  final Alignment alignment;

  static const defaultSized = LinearFirstSectionRatio._(
    3 / 10,
    Alignment(0.0, -0.95),
  );
  static const halfSized = LinearFirstSectionRatio._(
    1 / 2,
    Alignment(0.0, -0.95),
  );
  static const bigSized = LinearFirstSectionRatio._(
    3 / 5,
    Alignment(0.0, -0.85),
  );

  Alignment get beginAlignment => alignment;
}
