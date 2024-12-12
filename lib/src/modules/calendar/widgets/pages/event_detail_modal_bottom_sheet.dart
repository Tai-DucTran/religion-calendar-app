import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/constants/other_implementation_constants.dart';
import 'package:religion_calendar_app/src/modules/calendar/calendar.dart';

class EventDetailModalBottomSheet extends ConsumerStatefulWidget {
  const EventDetailModalBottomSheet(
    this.selectedDate, {
    super.key,
    this.eventId,
  });

  final DateTime? selectedDate;
  final String? eventId;

  static Future<bool> show(
    BuildContext context, {
    DateTime? selectedDate,
    String? eventId,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AriesColor.neutral0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (context) => EventDetailModalBottomSheet(
        selectedDate,
        eventId: eventId,
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
  TextEditingController eventNameInputController = TextEditingController(),
      eventDescriptionController = TextEditingController(),
      eventLocationInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized && widget.eventId != null) {
      _loadEventData();
      _isInitialized = true;
    }
  }

  Future<void> _loadEventData() async {
    final userEventsAsync = ref.watch(userEventControllerProvider);
    final List<UserEvent> userEvents = await userEventsAsync.when(
      data: (data) => data,
      error: (_, __) => [],
      loading: () => [],
    );

    if (mounted) {
      final event = userEvents.firstWhere((e) => e.id == widget.eventId);
      eventNameInputController.text = event.title;
      if (event.calendarCategory == CalendarCategory.lunar) {
        ref.read(calendarCategoryControllerProvider.notifier).toggleCategory();
      }
      ref
          .read(eventCategoryControllerProvider.notifier)
          .setCategory(event.eventCategory);
      if (event.isAllDay == true) {
        ref.read(isAllDayToggleControllerProvider.notifier).toggle();
      }
      final eventDateTime = ref.read(eventDateTimeControllerProvider.notifier);
      eventDateTime.setStartDate(event.startDate);
      eventDateTime.setStartTime(event.startDate);
      eventDateTime.setEndDate(event.endDate);
      eventDateTime.setEndTime(event.endDate);
      final remindMeBeforeOption =
          getRemindMeBeforeOptionsJsonValue(event.remindMeBefore);
      ref
          .read(remindMeBeforeControllerProvider.notifier)
          .setOption(remindMeBeforeOption);
      final repeatedFrequencyAt =
          getRepeatedFrequencyJsonValue(event.repeatedFrequencyAt);
      ref
          .read(repeatedFrequencyControllerProvider.notifier)
          .setFrequency(repeatedFrequencyAt);
      eventLocationInputController.text = event.location;
      eventDescriptionController.text = event.description;
      ref.read(createEventAtControllerProvider.notifier).set(event.createdAt);
      ref.watch(createEventAtControllerProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return FractionallySizedBox(
      heightFactor: bottomSheetHeightFactorMax,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TopAction(
                eventId: widget.eventId,
                eventNameInputController: eventNameInputController,
                eventLocationInputController: eventLocationInputController,
                eventDescriptionController: eventDescriptionController,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(bottom: 24.h),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        EventNameInput(
                          controller: eventNameInputController,
                        ),
                        const Divider(),
                        Spacing.sp18,
                        const IsLunarCalendarToggle(),
                        Spacing.sp18,
                        const EventCategorySelect(),
                        Spacing.sp18,
                        const IsAllDayToggle(),
                        Spacing.sp18,
                        const CustomDateTimeSelect(
                          isStartDate: true,
                        ),
                        Spacing.sp18,
                        const CustomDateTimeSelect(
                          isStartDate: false,
                        ),
                        Spacing.sp18,
                        const RemindMeBeforeSelect(),
                        Spacing.sp18,
                        const RepeatedFrequencySelect(),
                        Spacing.sp12,
                        const Divider(),
                        Spacing.sp12,
                        EventLocationInput(
                          controller: eventLocationInputController,
                        ),
                        Spacing.sp12,
                        const Divider(),
                        Spacing.sp12,
                        EventDescriptionInput(
                          controller: eventDescriptionController,
                        ),
                        Spacing.sp12,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
