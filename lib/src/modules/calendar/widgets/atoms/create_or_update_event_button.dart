import 'package:aries/aries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/modules/notification/notification.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CreateOrUpdateEventButton extends ConsumerWidget {
  const CreateOrUpdateEventButton({
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

  Future<void> createOrUpdateEvent(BuildContext context, WidgetRef ref) async {
    try {
      final calendarCategory = ref.watch(calendarCategoryControllerProvider);
      final selectedCategory = ref.watch(eventCategoryControllerProvider);
      final isAllDay = ref.watch(isAllDayToggleControllerProvider);
      final currentEventDateTime = ref.watch(eventDateTimeControllerProvider);
      final startDateTime = DateTime(
        currentEventDateTime.startDate.year,
        currentEventDateTime.startDate.month,
        currentEventDateTime.startDate.day,
        currentEventDateTime.startTime?.hour ?? 8,
        currentEventDateTime.startTime?.minute ?? 0,
      );
      final endDateTime = DateTime(
        currentEventDateTime.endDate.year,
        currentEventDateTime.endDate.month,
        currentEventDateTime.endDate.day,
        currentEventDateTime.endTime?.hour ?? 23,
        currentEventDateTime.endTime?.minute ?? 0,
      );
      final repeatedFrequencyAt =
          ref.watch(repeatedFrequencyControllerProvider);
      final remindMeBefore = ref.watch(remindMeBeforeControllerProvider);
      final createEventAt = ref.watch(createEventAtControllerProvider);

      final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
      final userId = authenticatorRepo.currentUser?.uid;
      final eventsCollection = FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .doc(userId)
          .collection(FirebaseCollectionName.events);

      UserEvent userEvent = UserEvent(
        id: eventId ?? eventsCollection.doc().id,
        title: eventNameInputController.text,
        calendarCategory: calendarCategory,
        eventCategory: selectedCategory,
        isAllDay: isAllDay,
        startDate: startDateTime,
        endDate: endDateTime,
        location: eventLocationInputController.text,
        createdAt: createEventAt,
        updatedAt: DateTime.now(),
        repeatedFrequencyAt: repeatedFrequencyAt.toRecurrenceRule().toString(),
        remindMeBefore: remindMeBefore.fromStringToDouble,
        description: eventDescriptionController.text,
      );

      if (eventId != null) {
        await eventsCollection.doc(eventId).update(userEvent.toJson());
      } else {
        await eventsCollection.doc(userEvent.id).set(userEvent.toJson());
      }

      // Schedule notification for the event (undoned)
      // await _scheduleEventNotification(userEvent);

      if (context.mounted) {
        Navigator.of(context).pop(true);
        if (eventId != null) {
          Navigator.of(context).pop(true);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: eventId != null
                ? context.l10n.eventUpdatedSuccessfullyText
                : context.l10n.eventCreatedSuccessfullyText,
            snackbarType: SnackbarType.success,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: eventId != null
                ? context.l10n.eventUpdatedFailedText
                : context.l10n.eventCreatedFailedText,
            snackbarType: SnackbarType.error,
          ),
        );
      }
    }
  }

// TODO (Thang): Setup notifications for local devices
// https://taisidehustle.atlassian.net/browse/KAN-170

  Future<void> _scheduleEventNotification(UserEvent event) async {
    final notificationTime = event.startDate
        .subtract(Duration(minutes: event.remindMeBefore.toInt()));

    if (notificationTime.isAfter(DateTime.now())) {
      await NotificationService().scheduleEventNotification(
        eventId: event.id,
        title: event.title,
        body:
            '${DateFormat('HH:mm').format(event.startDate)}${event.location.isNotEmpty ? ' at ${event.location}' : ''}',
        scheduledTime: notificationTime,
      );

      Log.dev('Notification scheduled for ${event.title} at $notificationTime');
    } else {
      Log.info(
          'Skipped notification for ${event.title} - reminder time has already passed');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  context.l10n.cancelButtonText,
                  style: AriesTextStyles.textBodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AriesColor.yellowP950,
                  ),
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () => createOrUpdateEvent(
                  context,
                  ref,
                ),
                child: Text(
                  eventId == null
                      ? context.l10n.createEventButtonText
                      : context.l10n.updateEventButtonText,
                  style: AriesTextStyles.textBodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AriesColor.yellowP950,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
