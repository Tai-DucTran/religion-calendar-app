import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final double indent;
  final double endIndent;

  const DashDivider({
    super.key,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashHeight = 1.0,
    this.dashSpacing = 3.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount =
              (constraints.constrainWidth() / (dashWidth + dashSpacing))
                  .floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return Container(
                width: dashWidth,
                height: dashHeight,
                color: color,
              );
            }),
          );
        },
      ),
    );
  }
}
