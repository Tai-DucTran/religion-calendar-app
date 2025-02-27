import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/constants/constants.dart';

class TodayEventQuote extends StatelessWidget {
  const TodayEventQuote({
    super.key,
    this.eventQuote,
  });

  final String? eventQuote;

  @override
  Widget build(BuildContext context) {
    return Text(
      eventQuote ?? gratitudeCatholicism,
      style: AriesTextStyles.textBodySmall.copyWith(
        fontWeight: FontWeight.w400,
      ),
      maxLines: 3,
    );
  }
}
