import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/utils/helpers.dart';

class FullCalendarWeekdayHeader extends StatelessWidget {
  const FullCalendarWeekdayHeader({
    super.key,
  });

  static String _getWeekdayName(int weekday, String locale) {
    final weekDayNames = getWeekDayNames(
      locale: locale,
      isShortName: true,
    );
    return weekDayNames[weekday];
  }

  static final TextStyle _textStyle = AriesTextStyles.textBodyMedium.copyWith(
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Text(
            _getWeekdayName(0, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(1, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(2, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(3, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(4, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(5, currentLocale),
            style: _textStyle,
          ),
        ),
        SizedBox(
          child: Text(
            _getWeekdayName(6, currentLocale),
            style: _textStyle,
          ),
        ),
      ],
    );
  }
}
