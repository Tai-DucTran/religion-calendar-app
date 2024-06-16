import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    this.height = 24,
    this.width = 24,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 110,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: backgroundColor,
          border: Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: borderColor ?? AriesColor.neutral50,
            ),
          ),
        ),
        child: SvgPicture.asset(
          iconPath,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
