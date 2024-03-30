import 'package:flutter/widgets.dart';

class Spacing {
  Spacing._();

  static const Widget shrink = SizedBox.shrink();

  static const SizedBox sp2 = SizedBox(
    width: 2,
    height: 2,
  );
  static const SizedBox sp4 = SizedBox(
    width: 4,
    height: 4,
  );
  static const SizedBox sp6 = SizedBox(
    width: 6,
    height: 6,
  );
  static const SizedBox sp8 = SizedBox(
    width: 8,
    height: 8,
  );
  static const SizedBox sp12 = SizedBox(
    width: 12,
    height: 12,
  );
  static const SizedBox sp14 = SizedBox(
    width: 14,
    height: 14,
  );
  static const SizedBox sp16 = SizedBox(
    width: 16,
    height: 16,
  );
  static const SizedBox sp18 = SizedBox(
    width: 18,
    height: 18,
  );
  static const SizedBox sp20 = SizedBox(
    width: 20,
    height: 20,
  );
  static const SizedBox sp24 = SizedBox(
    width: 24,
    height: 24,
  );
  static const SizedBox sp28 = SizedBox(
    width: 28,
    height: 28,
  );
  static const SizedBox sp32 = SizedBox(
    width: 32,
    height: 32,
  );
  static const SizedBox sp40 = SizedBox(
    width: 40,
    height: 40,
  );
  static const SizedBox sp48 = SizedBox(
    width: 48,
    height: 48,
  );

  static const Widget expand = Expanded(
    child: SizedBox(),
  );
}
