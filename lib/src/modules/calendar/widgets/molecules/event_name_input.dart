import 'package:flutter/material.dart';
import 'package:aries/aries.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class EventNameInput extends StatelessWidget {
  const EventNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacing.sp24,
        Flexible(
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: LocalizedKeys.eventInputHintText,
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            style: const TextStyle(
              fontSize: 20, // Adjust font size as needed
            ),
          ),
        ),
      ],
    );
  }
}