import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class ViewEventModalBottomSheet extends ConsumerStatefulWidget {
  const ViewEventModalBottomSheet(this.event, {super.key});

  final BasedEvent event;

  static Future<bool> show(
    BuildContext context, {
    required BasedEvent event,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.neutral0,
      builder: (context) => ViewEventModalBottomSheet(
        event,
      ),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewEventModalBottomSheetState();
}

class _ViewEventModalBottomSheetState
    extends ConsumerState<ViewEventModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    BasedEvent event = widget.event;

    final screenHeight = MediaQuery.of(context).size.height;
    final bottomSheetHeight = screenHeight * bottomSheetHeightFactorMax;
    final deleteButtonHeight = 75.h;
    final bannerHeight = 150.w;

    return FractionallySizedBox(
      heightFactor: bottomSheetHeightFactorMax,
      child: Container(
        height: bottomSheetHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
          color: AriesColor.neutral0,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                TopBanner(
                  event: event,
                  bannerHeight: bannerHeight,
                ),
                Spacing.sp12,
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 12.w,
                        left: 16.w,
                        right: 16.w,
                        bottom: deleteButtonHeight + 10.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          EventCategoryText(
                            eventCategory: event.eventCategory,
                          ),
                          EventTitleText(
                            title: event.title,
                          ),
                          DateText(
                            eventStartDate: event.startDate,
                          ),
                          if (event.repeatedFrequencyAt != null &&
                              event.repeatedFrequencyAt!.isNotEmpty)
                            RepeatedFrequencyText(
                              repeatedFrequencyAt: event.repeatedFrequencyAt!,
                            ),
                          if (event.location != null &&
                              event.location!.isNotEmpty)
                            EventLocationText(
                              location: event.location!,
                            ),
                          if (event.description != null &&
                              event.description!.isNotEmpty)
                            EventDescriptionText(
                              event: event,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            event.eventCategory == EventCategory.religionEvent
                ? MoreDetailsButton(
                    event: event,
                    deleteButtonHeight: deleteButtonHeight,
                  )
                : DeleteEventButton(
                    eventId: event.id,
                  )
          ],
        ),
      ),
    );
  }
}
