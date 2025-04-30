import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';

class CloseStatusBottomText extends StatelessWidget {
  const CloseStatusBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.closedChatMessageText,
        style: AriesTextStyles.textBodySmall,
      ),
    );
  }
}
