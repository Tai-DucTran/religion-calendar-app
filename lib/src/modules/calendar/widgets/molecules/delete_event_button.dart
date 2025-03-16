import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class DeleteEventButton extends ConsumerWidget {
  const DeleteEventButton({
    super.key,
    required this.eventId,
  });

  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () => DeleteConfirmation.showDeleteConfirmation(
              context,
              ref,
              eventId,
            ),
            child: Text(
              context.l10n.deleteEventButtonText,
              style: AriesTextStyles.textBodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AriesColor.danger400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
