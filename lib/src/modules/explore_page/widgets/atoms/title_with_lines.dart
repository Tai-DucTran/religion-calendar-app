import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithLines extends StatelessWidget {
  final String text;
  final Color lineColor;
  final TextStyle? textStyle;

  const TitleWithLines({
    super.key,
    required this.text,
    this.lineColor = Colors.grey,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: lineColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
