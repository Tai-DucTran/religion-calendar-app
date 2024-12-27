import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class TopAction extends StatelessWidget {
  const TopAction({
    super.key,
    required this.eventId,
    required this.eventNameInputController,
    required this.eventLocationInputController,
    required this.eventDescriptionController,
  });

  final String? eventId;
  final TextEditingController eventNameInputController,
      eventLocationInputController,
      eventDescriptionController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.w,
      child: Column(
        children: [
          BannerLine(),
          CreateOrUpdateEventButton(
            eventId: eventId,
            eventNameInputController: eventNameInputController,
            eventLocationInputController: eventLocationInputController,
            eventDescriptionController: eventDescriptionController,
          )
        ],
      ),
    );
  }
}
