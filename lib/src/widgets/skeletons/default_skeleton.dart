import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DefaultSkeleton extends StatelessWidget {
  const DefaultSkeleton({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const ShimmerEffect(
        baseColor: AriesColor.neutral40,
      ),
      enableSwitchAnimation: true,
      child: child,
    );
  }
}
