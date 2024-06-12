import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({
    super.key,
    required this.title,
    this.keyboardType,
    this.hintText,
    this.textCapitalization,
    this.controller,
    required this.obscureText,
  });

  final String title;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    final textInputStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: AriesColor.neutral300);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacing.sp6,
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          autocorrect: false,
          cursorColor: AriesColor.neutral50,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          style: textInputStyle,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: textInputStyle,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AriesColor.neutral50,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AriesColor.yellowP300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
