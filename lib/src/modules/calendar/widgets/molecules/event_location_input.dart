import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class EventLocationInput extends StatefulWidget {
  const EventLocationInput({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<EventLocationInput> createState() => _EventLocationInputState();
}

class _EventLocationInputState extends State<EventLocationInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: AriesColor.neutral100,
        ),
        Spacing.sp8,
        Flexible(
          child: TextField(
            maxLines: null,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: LocalizedKeys.eventLocationHint,
              border: InputBorder.none,
              hintStyle: const TextStyle(
                color: AriesColor.neutral50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
