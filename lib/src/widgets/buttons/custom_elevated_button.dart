import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.fontSize = 18,
    this.height = 48,
    this.radius = 8,
    this.buttonColor = AriesColor.yellowP950,
    required this.text,
    this.onPressed,
    this.onPressedAsync,
    this.width,
    this.textStyle,
    this.showLoadingIndicator = true,
  });

  final double marginHorizontal;
  final double marginVertical;
  final double radius;
  final String text;
  final double fontSize;
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final bool showLoadingIndicator;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    if (widget.onPressedAsync != null) {
      setState(() {
        _isLoading = true;
      });
      try {
        await widget.onPressedAsync!();
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(
        vertical: widget.marginVertical,
        horizontal: widget.marginHorizontal,
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radius),
            ),
          ),
          disabledBackgroundColor: AriesColor.neutral40,
        ),
        child: _isLoading && widget.showLoadingIndicator
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.textStyle?.color ?? AriesColor.neutral0,
                  ),
                ),
              )
            : Text(
                widget.text,
                style: widget.textStyle ??
                    AriesTextStyles.textHeading7.copyWith(
                      color: AriesColor.neutral0,
                    ),
              ),
      ),
    );
  }
}
