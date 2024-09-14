import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/molecules/molecules.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/organism/organism.dart';
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
  TextEditingController locationController = TextEditingController();

  String? selectedOption;
  DateTime? selectStartedDate;
  DateTime? selectStartedTime;
  DateTime? selectEndedDate;
  DateTime? selectEndedTime;

  void onStartedDateSelect(DateTime value) {
    setState(() {
      selectStartedDate = value;
    });
  }

  void onStartedTimeSelected(DateTime value) {
    setState(() {
      selectStartedTime = value;
    });
  }

  void onEndedDateSelect(DateTime value) {
    setState(() {
      selectEndedDate = value;
    });
  }

  void onEndedTimeSelect(DateTime value) {
    setState(() {
      selectEndedTime = value;
    });
  }

  DateTime startedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    08,
    00,
  );

  DateTime endedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    23,
    00,
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      heightFactor: 0.90,
      child: Container(
        height: screenHeight * 0.90,
        width: double.infinity,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16,
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
            const DropDownEventCategorySelectModal(),
            Spacing.sp12,
            const AllDayToggleSwitch(),
            Spacing.sp12,
            const CalendarCategorySelector(),
            Spacing.sp12,
            DateTimePickerSection(
              label: LocalizedKeys.startingEventDateText,
              initialDate: widget.selectedDate,
              initialTime: startedTime,
              onDateSelect: onStartedDateSelect,
              onTimeSelect: onStartedTimeSelected,
            ),
            DateTimePickerSection(
              label: LocalizedKeys.endingEventDateText,
              initialDate: widget.selectedDate,
              initialTime: endedTime,
              onDateSelect: onEndedDateSelect,
              onTimeSelect: onEndedTimeSelect,
            ),
          ],
        ),
      ),
    );
  }
}
