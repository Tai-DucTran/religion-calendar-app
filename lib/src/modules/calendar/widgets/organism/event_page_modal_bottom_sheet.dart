import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class EventPageModalBottomSheet extends ConsumerStatefulWidget {
  const EventPageModalBottomSheet(this.userId, this.selectedDate, {super.key});

  final UserId userId;
  final DateTime? selectedDate;

  static Future<bool> show(
    BuildContext context, {
    required String userId,
    DateTime? selectedDate,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.neutral0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      builder: (context) => EventPageModalBottomSheet(
        userId,
        selectedDate,
      ),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventPageModalBottomSheetState();
}

class _EventPageModalBottomSheetState
    extends ConsumerState<EventPageModalBottomSheet> {
  TextEditingController eventNameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.94,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacing.sp24,
            Center(
              child: IntrinsicWidthTextField(
                controller: eventNameInputController,
                hintText: LocalizedKeys.eventInputHintText,
              ),
            ),
            Spacing.sp12,
            const IsLunarCalendarToggle(),
            Spacing.sp12,
            const DropDownEventCategorySelectModal(),
            Spacing.sp32,
            const IsAllDayToggle(),
            Spacing.sp12,
            const CustomDateTimePicker(
              isStartDate: true,
            ),
            const CustomDateTimePicker(
              isStartDate: false,
            ),
            Spacing.sp24,
            const EventDivider(),
            Spacing.sp12,
            const EventLocationInput(),
          ],
        ),
      ),
    );
  }
}
