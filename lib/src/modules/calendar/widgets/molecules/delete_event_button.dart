import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DeleteEventButton extends StatelessWidget {
  const DeleteEventButton({
    super.key,
    required this.deleteButtonHeight,
    required this.event,
  });

  final double deleteButtonHeight;
  final BasedEvent event;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: deleteButtonHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AriesColor.neutral0.withOpacity(0.9),
              AriesColor.neutral0.withOpacity(1),
            ],
          ),
        ),
        child: Center(
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
            },
            child: Text(
              LocalizedKeys.deleteEventButtonText,
              style: AriesTextStyles.textBodySmall.copyWith(
                color: AriesColor.danger400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}