import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/constant_values.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';

class EventDetailModalBottomSheet extends ConsumerStatefulWidget {
  const EventDetailModalBottomSheet(this.selectedDate, {super.key});

  final DateTime? selectedDate;

  static Future<bool> show(
    BuildContext context, {
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return FractionallySizedBox(
      heightFactor: bottomSheetHeightFactorMax,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomPadding,
        ),
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
                children: [
                  Spacing.sp18,
                  EventNameInput(
                    controller: eventNameInputController,
                  ),
                  const Divider(),
                  Spacing.sp18,
                  const IsLunarCalendarToggle(),
                  Spacing.sp18,
                  const EventCategorySelect(),
                  Spacing.sp18,
                  const IsAllDayToggle(),
                  Spacing.sp18,
                  const CustomDateTimeSelect(
                    isStartDate: true,
                  ),
                  Spacing.sp18,
                  const CustomDateTimeSelect(
                    isStartDate: false,
                  ),
                  Spacing.sp18,
                  const Divider(),
                  Spacing.sp12,
                  const EventLocationInput(),
                  Spacing.sp12,
                  const Divider(),
                  Spacing.sp18,
                  const RepeatedFrequencySelect(),
                  Spacing.sp12,
                  const RemindMeBeforeSelect(),
                  Spacing.sp12,
                  const Divider(),
                  Spacing.sp12,
                  EventDescriptionInput(
                    controller: eventDescriptionController,
                  ),
                  Spacing.sp12,
                  CreateEventButton(
                    eventNameInputController: eventNameInputController,
                    eventDescriptionController: eventDescriptionController,
                  ),
                  Spacing.sp12,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}