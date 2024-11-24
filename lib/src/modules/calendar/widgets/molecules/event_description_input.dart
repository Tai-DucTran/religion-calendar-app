import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';

class EventDescriptionInput extends StatefulWidget {
  const EventDescriptionInput({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<EventDescriptionInput> createState() => _EventDescriptionInputState();
}

class _EventDescriptionInputState extends State<EventDescriptionInput> {
  TextEditingController eventDescriptionController = TextEditingController();
  void onTextChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    eventDescriptionController.addListener(onTextChanged);
  }

  @override
  void dispose() {
    eventDescriptionController.removeListener(onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.text_justifyleft,
          color: AriesColor.neutral100,
        ),
        Spacing.sp8,
        Flexible(
          child: TextField(
            controller: widget.controller,
            maxLines: null,
            decoration: InputDecoration(
              hintText: LocalizedKeys.descriptionHint,
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
