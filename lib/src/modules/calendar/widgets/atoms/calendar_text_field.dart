import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarTextField extends StatefulWidget {
  const CalendarTextField({
    super.key,
    this.minLines = 1,
    this.maxLines = 4,
    this.cursorHeight = 20,
    this.hintMaxLine = 2,
    required this.hintText,
    required this.controller,
  });

  final int? minLines;
  final int? maxLines;
  final double? cursorHeight;
  final int? hintMaxLine;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      cursorHeight: widget.cursorHeight,
      cursorColor: AriesColor.neutral60,
      style: AriesTextStyles.textInputField,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 4.h,
        ),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: AriesTextStyles.textHintTextField,
        hintMaxLines: widget.hintMaxLine,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
