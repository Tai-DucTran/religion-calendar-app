import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/molecules/custom_date_time_select_thang.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    // return FractionallySizedBox(
    //   heightFactor: 0.94,
    //   child: Padding(
    //     padding: EdgeInsets.only(bottom: bottomPadding),
    //     child: Container(
    //       width: double.infinity,
    //       padding: EdgeInsets.only(
    //         top: 16.h,
    //         left: 16.w,
    //         right: 16.w,
    //       ),
    //       child: ListView(
    //         children: [
    //           Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Spacing.sp24,
    //               Center(
    //                 child: IntrinsicWidthTextField(
    //                   controller: eventNameInputController,
    //                   hintText: LocalizedKeys.eventInputHintText,
    //                 ),
    //               ),
    //               Spacing.sp12,
    //               const IsLunarCalendarToggle(),
    //               Spacing.sp12,
    //               const EventCategorySelect(),
    //               Spacing.sp32,
    //               const IsAllDayToggle(),
    //               Spacing.sp12,
    //               const CustomDateTimeSelect(
    //                 isStartDate: true,
    //               ),
    //               const CustomDateTimeSelect(
    //                 isStartDate: false,
    //               ),
    //               Spacing.sp24,
    //               const EventDivider(),
    //               Spacing.sp12,
    //               const EventLocationInput(),
    //               Spacing.sp12,
    //               const RepeatedFrequencySelect(),
    //               Spacing.sp12,
    //               const RemindMeBeforeSelect(),
    //               Spacing.sp12,
    //               const EventDescriptionInput(),
    //               Spacing.sp12,
    //               SizedBox(
    //                 height: 20.h,
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

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
                children: [
                  Spacing.sp18,
                  const EventNameInput(),
                  const Divider(),
                  Spacing.sp18,
                  const IsLunarCalendarToggle(),
                  Spacing.sp18,
                  const EventCategorySelect(),
                  Spacing.sp18,
                  const IsAllDayToggle(),
                  Spacing.sp18,
                  const CustomDateTimeSelectThang(
                    isStartDate: true,
                  ),
                  Spacing.sp18,
                  const CustomDateTimeSelectThang(
                    isStartDate: false,
                  ),
                  // const fromDateTimePicker(),
                  // Spacing.sp18,
                  // const toDateTimePicker(),
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
                  const EventDescriptionInput(),
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

class fromDateTimePicker extends StatefulWidget {
  const fromDateTimePicker({
    super.key,
  });

  @override
  State<fromDateTimePicker> createState() => _fromDateTimePickerState();
}

class _fromDateTimePickerState extends State<fromDateTimePicker> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d MMM').format(_selectedDate);
    String formattedTime = DateFormat('HH:mm').format(DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 22.w,
        ),
        Spacing.sp8,
        GestureDetector(
          onTap: _selectDate,
          child: Text(formattedDate),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _selectTime,
          child: Text(formattedTime),
        ),
      ],
    );
  }
}

class toDateTimePicker extends StatefulWidget {
  const toDateTimePicker({
    super.key,
  });

  @override
  State<toDateTimePicker> createState() => _toDateTimePickerState();
}

class _toDateTimePickerState extends State<toDateTimePicker> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, d MMM').format(_selectedDate);
    String formattedTime = DateFormat('HH:mm').format(DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 22.w,
        ),
        Spacing.sp8,
        GestureDetector(
          onTap: _selectDate,
          child: Text(formattedDate),
        ),
        const Spacer(),
        GestureDetector(
          onTap: _selectTime,
          child: Text(formattedTime),
        ),
      ],
    );
  }
}

class timePicker extends StatefulWidget {
  const timePicker({super.key});

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<timePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _handleTimeChanged(TimeOfDay newTime) {
    setState(() {
      _selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _selectedTime.format(context); // Format the time

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Text('At time:'),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: _selectedTime,
              );
              if (newTime != null) {
                _handleTimeChanged(newTime);
              }
            },
            child: Text(formattedTime),
          ),
        ],
      ),
    );
  }
}

// class toDatePick extends StatelessWidget {
//   const toDatePick({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FastDatePicker(
//       name: 'from_date_picker',
//       labelText: 'To',
//       firstDate: DateTime(1970),
//       lastDate: DateTime(2040),
//     );
//   }
// }

// class fromDatePick extends StatelessWidget {
//   const fromDatePick({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FastDatePicker(
//       name: 'from_date_picker',
//       labelText: 'From',
//       firstDate: DateTime(1970),
//       lastDate: DateTime(2040),
//     );
//   }
// }
