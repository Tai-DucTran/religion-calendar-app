import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class IntrinsicWidthTextField extends StatefulWidget {
  const IntrinsicWidthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textFieldStyle,
    this.textInputType,
    this.maxLine,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle? textFieldStyle;
  final TextInputType? textInputType;
  final int? maxLine;

  @override
  State<IntrinsicWidthTextField> createState() =>
      _IntrinsicWidthTextFieldState();
}

class _IntrinsicWidthTextFieldState extends State<IntrinsicWidthTextField> {
  bool isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        isTextFieldEmpty = widget.controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        widget.textFieldStyle ?? AriesTextStyles.textHeading6;

    return IntrinsicWidth(
      child: TextField(
        controller: widget.controller,
        autocorrect: false,
        autofocus: true,
        enableSuggestions: false,
        maxLines: widget.maxLine ?? 2,
        minLines: 1,
        textAlign: isTextFieldEmpty ? TextAlign.start : TextAlign.center,
        style: textStyle,
        cursorColor: AriesColor.black,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: textStyle.copyWith(
            color: AriesColor.neutral50,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
