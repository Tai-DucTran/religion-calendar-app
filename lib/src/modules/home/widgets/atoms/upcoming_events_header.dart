import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class UpComingEventsHeader extends StatelessWidget {
  const UpComingEventsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocalizedKeys.yourEventText,
          style: AriesTextStyles.textHeading6,
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: () async {
          final result = await AllEventsModalBottomSheet.show(
            context,
          );
          if (!result) return;
        },
          child: Text(
            LocalizedKeys.viewAllButtonText,
            style: AriesTextStyles.textBodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AriesColor.yellowP950,
            ),
          ),
        ),
      ],
    );
  }
}
