import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldContainer extends StatefulWidget {
  const TextFormFieldContainer({
    super.key,
    required this.title,
    this.keyboardType,
    this.hintText,
    this.textCapitalization,
    this.controller,
    this.obscureText,
    this.validator,
    this.suffixIcon,
    this.titleStyle,
    this.textFieldColors,
    this.enable,
  });

  final String title;
  final TextStyle? titleStyle;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color? textFieldColors;
  final bool? enable;

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
    final isEnabled = widget.enable ?? true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: widget.titleStyle ??
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
        Spacing.sp6,
        Container(
          decoration: BoxDecoration(
            color: isEnabled ? widget.textFieldColors : AriesColor.neutral30,
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText ?? false,
            keyboardType: widget.keyboardType,
            autocorrect: false,
            cursorColor: AriesColor.neutral50,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            style: textInputStyle,
            validator: widget.validator,
            enabled: isEnabled,
            decoration: InputDecoration(
              enabled: isEnabled,
              hintText: widget.hintText,
              hintStyle: textInputStyle,
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: widget.suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                borderSide: BorderSide(
                  color: AriesColor.neutral50,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                borderSide: BorderSide(
                  color: AriesColor.neutral50,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                borderSide: BorderSide(
                  color: AriesColor.danger300,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                borderSide: BorderSide(
                  color: AriesColor.danger300,
                ),
              ),
              errorStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AriesColor.danger300,
                  ),
              errorMaxLines: 2,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                borderSide: BorderSide(
                  color: AriesColor.yellowP300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
