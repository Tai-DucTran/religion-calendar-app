import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class LoadingOverlayContainer extends StatelessWidget {
  const LoadingOverlayContainer({
    super.key,
    this.hasOverlayBackground,
  });

  final bool? hasOverlayBackground;

  @override
  Widget build(BuildContext context) {
    return hasOverlayBackground ?? false
        ? Material(
            color: Colors.black38,
            child: LoadingAnimatorContainer(),
          )
        : LoadingAnimatorContainer();
  }
}
