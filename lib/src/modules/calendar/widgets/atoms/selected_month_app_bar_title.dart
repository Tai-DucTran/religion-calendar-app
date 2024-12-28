import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/date_time_format.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

class SelectedMonthAppBarTitle extends ConsumerWidget {
  const SelectedMonthAppBarTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedMonth = ref.watch(displayedMonthProvider);
    final currentLocale = Localizations.localeOf(context).languageCode;

    return Text(
      DateFormat(
        DateTimeFormat.monthYear,
        currentLocale,
      )
          .format(
            displayedMonth,
          )
          .toCapitalized(),
      style: AriesTextStyles.textHeading5,
    );
  }
}
