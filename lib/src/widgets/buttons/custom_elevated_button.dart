import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.fontSize = 18,
    this.height = 48,
    this.radius = 8,
    required this.buttonColor,
    required this.text,
    required this.onPressed,
    this.width,
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AriesColor.neutral900,
    ),
  });

  final double marginHorizontal;
  final double marginVertical;
  final Color? buttonColor;
  final double radius;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: marginVertical,
        horizontal: marginHorizontal,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
