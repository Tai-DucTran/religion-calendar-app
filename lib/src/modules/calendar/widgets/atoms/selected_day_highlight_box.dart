import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class SelectedDayHighlightBox extends StatelessWidget {
  const SelectedDayHighlightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: AriesColor.neutral50.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
