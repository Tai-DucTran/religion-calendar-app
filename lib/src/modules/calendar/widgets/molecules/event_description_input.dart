import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';

class EventDescriptionInput extends StatefulWidget {
  const EventDescriptionInput({super.key});

  @override
  State<EventDescriptionInput> createState() => _EventDescriptionInputState();
}

class _EventDescriptionInputState extends State<EventDescriptionInput> {
  TextEditingController eventDescriptionController = TextEditingController();
  void onTextChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    eventDescriptionController.addListener(onTextChanged);
  }

  @override
  void dispose() {
    eventDescriptionController.removeListener(onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 8.sp,
          ),
          child: Text(
            'Description:',
            style: AriesTextStyles.textHeading6.copyWith(
              color: AriesColor.neutral800,
            ),
          ),
        ),
        Flexible(
          child: CalendarTextField(
            controller: eventDescriptionController,
            hintText: 'Add event description...',
          ),
        ),
      ],
    );
  }
}
