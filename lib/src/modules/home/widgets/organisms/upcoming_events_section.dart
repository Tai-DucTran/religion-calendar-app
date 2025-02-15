import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/admob/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';
import 'package:religion_calendar_app/src/modules/home/widgets/widgets.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class UpComingEventsSection extends ConsumerWidget {
  const UpComingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(combineEventsControllerProvider);
    final nativeAd = ref.watch(nativeAdControllerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UpComingEventsHeader(),
          events.when(
            loading: () => DefaultSkeleton(
              child: EventCard(
                eventName: mockLoadingTextContent,
                eventDate: DateTime.now(),
                eventTime: mockLoadingTextContent,
                eventCategory: EventCategory.businessEvent,
                eventLocation: mockLoadingTextContent,
                isLoading: true,
              ),
            ),
            error: (error, stackTrace) => const Offstage(),
            data: (events) {
              if (events.isEmpty) {
                return Text(LocalizedKeys.emptyEventText);
              }

              final displayedEvents = getUpcomingEvents(events);

              return Column(
                children: [
                  ...displayedEvents.map(
                    (event) {
                      final eventTime = DateFormat(DateTimeFormat.hourMinute)
                          .format(event.startDate);

                      return GestureDetector(
                        onTap: () async {
                          final result = await ViewEventModalBottomSheet.show(
                            context,
                            event: event,
                          );
                          if (!result) return;
                        },
                        child: EventCard(
                          eventName: event.title,
                          eventDate: event.startDate,
                          eventTime: eventTime,
                          eventCategory: event.eventCategory,
                          eventLocation: event.location,
                        ),
                      );
                    },
                  ),
                  Spacing.sp8,
                  // Native Ad Section
                  nativeAd.when(
                    data: (ad) => ad != null
                        ? Container(
                            padding: EdgeInsets.all(16.w),
                            height: 120.h, // Fixed height for the ad container
                            width: double.infinity, // Full width
                            decoration: BoxDecoration(
                              color: AriesColor.neutral0,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AriesColor.yellowP600.withOpacity(0.1),
                                  offset: const Offset(0, 2),
                                  blurRadius: 13.4,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 88
                                  .h, // Height for the actual ad widget (120 - 2*16 padding)
                              child: AdWidget(ad: ad),
                            ),
                          )
                        : const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (_, __) => IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        ref
                            .read(nativeAdControllerProvider.notifier)
                            .reloadAd();
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
