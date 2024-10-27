import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatefulWidget {
  const TextFormFieldContainer({
    super.key,
    required this.title,
    this.keyboardType,
    this.hintText,
    this.textCapitalization,
    this.controller,
    required this.obscureText,
    this.validator,
    this.suffixIcon,
  });

  final String title;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  State<TextFormFieldContainer> createState() => _TextFormFieldContainerState();
}

class _TextFormFieldContainerState extends State<TextFormFieldContainer> {
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
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          autocorrect: false,
          cursorColor: AriesColor.neutral50,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          style: textInputStyle,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: textInputStyle,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            suffixIcon: widget.suffixIcon,
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
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AriesColor.danger300,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: AriesColor.danger300,
              ),
            ),
            errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AriesColor.danger300,
                ),
            errorMaxLines: 2,
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
