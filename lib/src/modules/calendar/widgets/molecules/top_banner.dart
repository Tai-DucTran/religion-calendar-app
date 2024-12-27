import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final isReligionOrSpecialEvent =
        event.eventCategory == EventCategory.religionEvent ||
            event.eventCategory == EventCategory.specialEvent;

    final isReligionEvent = event.eventCategory == EventCategory.religionEvent;

    return Container(
      height: bannerHeight,
      decoration: BoxDecoration(
        color: isReligionOrSpecialEvent
            ? isReligionEvent
                ? AriesColor.yellowP50
                : AriesColor.success50
            : Color(0xffEAEFFD),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Stack(
        children: [
          BannerImage(
            img: isReligionOrSpecialEvent
                ? isReligionEvent
                    ? AriesImages.defaultCatholicismEvent1
                    : AriesImages.defaultChristmasEvent
                : AriesImages.defaultFamilyEvent1,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BannerLine(),
          ),
          if (!isReligionOrSpecialEvent)
            EditEventButton(
              eventId: event.id,
            ),
        ],
      ),
    );
  }
}
