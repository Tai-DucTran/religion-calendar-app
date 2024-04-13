import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double marginHorizontal;
  final double marginVertical;
  final Color? buttonColor;
  final double radius;
  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.fontSize = 18,
    this.radius = 8,
    required this.buttonColor,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ));
  }
}
