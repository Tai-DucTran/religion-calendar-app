import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        height: 75.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AriesColor.neutral0.withValues(
                alpha: 0.9,
              ),
              AriesColor.neutral0.withValues(
                alpha: 1,
              ),
            ],
          ),
        ),
        child: Center(
          child: CupertinoButton(
            onPressed: () {},
            child: Text(
              LocalizedKeys.moreDetailsButtonText,
              style: AriesTextStyles.textBodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AriesColor.yellowP950,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
