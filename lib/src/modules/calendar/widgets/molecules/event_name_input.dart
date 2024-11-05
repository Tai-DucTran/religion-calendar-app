import 'package:flutter/material.dart';
import 'package:aries/aries.dart';

class EventNameInput extends StatelessWidget {
  const EventNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacing.sp24,
        const Flexible(
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'What is event name?',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            style: TextStyle(
              fontSize: 20, // Adjust font size as needed
            ),
          ),
        ),
      ],
    );
  }
}