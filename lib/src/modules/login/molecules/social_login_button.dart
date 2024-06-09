import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    this.height = 44,
    this.width = 44,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
      ),
    );
  }
}
