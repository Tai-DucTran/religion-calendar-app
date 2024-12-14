import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class ObscureTextFormField extends StatefulWidget {
  const ObscureTextFormField({
    super.key,
    required this.title,
    this.keyboardType,
    this.hintText,
    this.textCapitalization,
    this.controller,
  });

  final String title;

  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<ObscureTextFormField> createState() => _ObscureTextFormFieldState();
}

class _ObscureTextFormFieldState extends State<ObscureTextFormField> {
  bool isObscured = true;
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
          obscureText: isObscured,
          keyboardType: widget.keyboardType,
          autocorrect: false,
          cursorColor: AriesColor.neutral50,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          style: textInputStyle,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              iconSize: 16,
              icon: isObscured
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
            ),
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
                color: AriesColor.yellowP950,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
