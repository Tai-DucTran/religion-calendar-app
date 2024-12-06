import 'package:flutter/cupertino.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
    required this.event,
    required this.imageURL,
    required this.bannerHeight,
  });

  final BasedEvent event;
  final String imageURL;
  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bannerHeight,
      child: Stack(
        children: [
          BannerImage(imageURL: imageURL),
          BannerLine(),
          EditEventButton(event: event),
        ],
      ),
    );
  }
}
