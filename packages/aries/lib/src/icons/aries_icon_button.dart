import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AriesIconButton extends StatelessWidget {
  const AriesIconButton({
    super.key,
    required this.iconPath,
    required this.onClick,
    this.color,
    this.size,
    this.blendMode,
  });

  final String iconPath;
  final VoidCallback onClick;
  final Color? color;
  final double? size;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: SvgPicture.asset(
        iconPath,
        height: size,
        width: size,
        colorFilter: ColorFilter.mode(
          color ?? AriesColor.black,
          blendMode ?? BlendMode.srcIn,
        ),
      ),
    );
  }
}
