import 'package:flutter/cupertino.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
    required this.event,
    required this.bannerHeight,
  });

  final BasedEvent event;
  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    bool isReligionEvent = event.eventCategory == EventCategory.religionEvent;

    return SizedBox(
      height: bannerHeight,
      child: Stack(
        children: [
          BannerImage(
            img: event.img,
          ),
          BannerLine(),
          if (!isReligionEvent)
            EditEventButton(
              eventId: event.id,
            ),
        ],
      ),
    );
  }
}
