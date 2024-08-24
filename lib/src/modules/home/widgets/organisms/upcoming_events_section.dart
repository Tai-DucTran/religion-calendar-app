import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';

class UpComingEventsSection extends StatelessWidget {
  const UpComingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const UpComingEventsHeader(),
        // TODO (Tai): Build the list of cards here
        UpcomingEventCard(
          eventName: "Grandfather's death anniversary",
          eventDate: currentDate,
          eventTime: "07:00",
          eventLocation: "Uncle's Tam house",
          eventTimeCountDown: 3,
          eventImageUrl: AriesImages.defaultFamilyEvent,
        ),
        UpcomingEventCard(
          eventName: "Sunday solemnity",
          eventDate: currentDate.add(const Duration(days: 4)),
          eventTime: "09:20",
          eventLocation: "Church",
          eventTimeCountDown: 4,
          eventImageUrl: AriesImages.defaultCatholicismEvent,
        ),
        UpcomingEventCard(
          eventName: "Sunday solemnity",
          eventDate: currentDate.add(const Duration(days: 7)),
          eventTime: "09:20",
          eventLocation: "Church",
          eventTimeCountDown: 7,
          eventImageUrl: AriesImages.defaultCatholicismEvent,
        ),
      ],
    );
  }
}
