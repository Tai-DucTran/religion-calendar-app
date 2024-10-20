import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class EventDivider extends StatelessWidget {
  const EventDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 5,
      decoration: BoxDecoration(
        color: AriesColor.neutral50,
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
