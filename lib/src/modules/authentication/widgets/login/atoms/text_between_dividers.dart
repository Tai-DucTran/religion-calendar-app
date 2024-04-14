import 'package:flutter/material.dart';

class TextBetweenDividers extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? textColor;
  final double thickness;
  final double height;
  final Color? dividerColor;
  final double marginHorizontal;
  final double marginVertical;

  const TextBetweenDividers({
    super.key,
    required this.text,
    required this.dividerColor,
    required this.textColor,
    this.thickness = 1,
    this.height = 1,
    this.marginHorizontal = 14,
    this.marginVertical = 0,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: thickness,
            height: height,
            color: dividerColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: marginVertical,
            horizontal: marginHorizontal,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
            height: height,
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}
