import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

class EventDetailModalBottomSheet extends ConsumerStatefulWidget {
  const EventDetailModalBottomSheet(this.userId, this.selectedDate,
      {super.key});

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
      builder: (context) => EventDetailModalBottomSheet(
        userId,
        selectedDate,
      ),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventDetailModalBottomSheetState();
}

class _EventDetailModalBottomSheetState
    extends ConsumerState<EventDetailModalBottomSheet> {
  TextEditingController eventNameInputController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return FractionallySizedBox(
      heightFactor: 0.94,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 16.h,
            left: 16.w,
            right: 16.w,
          ),
          child: ListView(
            children: [
              Column(
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
                  const EventCategorySelect(),
                  Spacing.sp32,
                  const IsAllDayToggle(),
                  Spacing.sp12,
                  const CustomDateTimeSelect(
                    isStartDate: true,
                  ),
                  const CustomDateTimeSelect(
                    isStartDate: false,
                  ),
                  Spacing.sp24,
                  const EventDivider(),
                  Spacing.sp12,
                  const EventLocationInput(),
                  Spacing.sp12,
                  const RepeatedFrequencySelect(),
                  Spacing.sp12,
                  const RemindMeBeforeSelect(),
                  Spacing.sp12,
                  const EventDescriptionInput(),
                  Spacing.sp12,
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
