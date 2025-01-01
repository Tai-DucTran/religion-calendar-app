import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class LunarDateCellData extends ConsumerWidget {
  const LunarDateCellData({
    super.key,
    required this.date,
    required this.isToday,
    this.isSelected,
  });

  final DateTime date;
  final bool? isSelected;
  final bool isToday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentLocale = Localizations.localeOf(context).toString();
    final lunarData = ref.watch(
      lunarCellDataProvider(
        (
          date: date,
          locale: currentLocale,
        ),
      ),
    );

    final color = getTextLunarColorInCalendar(
      isToday,
      isSelected ?? false,
      lunarData.isImportant,
    );

    return Text(
      lunarData.formattedText.toString(),
      style: AriesTextStyles.textBodySmall.copyWith(
        fontSize: 12.0,
        color: color,
      ),
    );
  }
}
