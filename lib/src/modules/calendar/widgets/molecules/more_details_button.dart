import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class MoreDetailsButton extends StatelessWidget {
  const MoreDetailsButton({
    super.key,
    required this.event,
    required this.deleteButtonHeight,
  });

  final BasedEvent event;
  final double deleteButtonHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFF8F1C9),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            LocalizedKeys.moreDetailsButtonText,
            style: AriesTextStyles.textBodySmall.copyWith(
              color: const Color(0xFF673C1C),
            ),
          ),
        ),
      ),
    );
  }
}
