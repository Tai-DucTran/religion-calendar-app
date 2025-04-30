import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';

class ConversationSection extends StatelessWidget {
  const ConversationSection({super.key, required this.messages});

  final List<dynamic> messages;

  @override
  Widget build(BuildContext context) {
    final selectedMessages = messages.length > 1 ? messages.sublist(1) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...selectedMessages.map(
          (message) => MessageBuddle(
            message: message,
            isFromTeam: message.isFromTeam,
          ),
        ),
      ],
    );
  }
}
