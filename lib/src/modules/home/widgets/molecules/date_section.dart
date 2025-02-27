import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DateSection extends ConsumerWidget {
  const DateSection({
    required this.inputDate,
    required this.isToday,
    required this.listMarkerColor,
    super.key,
  });

  final DateTime inputDate;
  final bool isToday;
  final List<Color> listMarkerColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentLocale = Localizations.localeOf(context).toString();
    final String date = DateFormat.d(currentLocale).format(
      inputDate,
    );
    final isBelongToLastMonth = isFromLastMonth(inputDate);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4.r),
      child: InkWell(
        onTap: () async {
          final result = await EventDetailModalBottomSheet.show(
            selectedDate: inputDate,
            context,
          );
          if (!result) return;
        },
        borderRadius: BorderRadius.circular(4.r),
        splashColor: AriesColor.yellowP200.withValues(
          alpha: 0.3,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 4.h,
                left: 12.w,
                right: 12.w,
                bottom: 4.h,
              ),
              margin: EdgeInsets.all(
                4.0.h,
              ),
              decoration: BoxDecoration(
                color: isToday ? AriesColor.yellowP100 : Colors.transparent,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.r),
                  bottom: Radius.circular(8.r),
                ),
                border: isToday
                    ? Border.all(
                        color: AriesColor.yellowP100,
                        width: 0,
                      )
                    : null,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.w,
                      bottom: 6.w,
                    ),
                    child: Text(
                      date,
                      style: AriesTextStyles.textBodyMedium.copyWith(
                        color: isBelongToLastMonth ? Colors.grey : Colors.black,
                        fontWeight:
                            isToday ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  LunarDateCellData(
                    date: inputDate,
                    isToday: isToday,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 3.w,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listMarkerColor.isEmpty
                          ? [
                              SizedBox(
                                width: 8.w,
                                height: 8.w,
                              )
                            ]
                          : listMarkerColor
                              .map(
                                (color) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.w,
                                  ),
                                  child: Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        4.r,
                                      ),
                                      color: color,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
