import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class CreateEventButton extends ConsumerWidget {
  const CreateEventButton({
    super.key,
    required this.eventNameInputController,
    required this.eventLocationInputController,
    required this.eventDescriptionController,
  });

  final TextEditingController eventNameInputController,
      eventLocationInputController,
      eventDescriptionController;

  Future<void> addEvent(BuildContext context, WidgetRef ref) async {
    try {
      final calendarCategory = ref.watch(calendarCategoryControllerProvider);
      final selectedCategory = ref.watch(eventCategoryControllerProvider);
      final isAllDay = ref.watch(isAllDayToggleControllerProvider);
      final currentEventDateTime = ref.watch(eventDateTimeControllerProvider);
      final repeatedFrequencyAt =
          ref.watch(repeatedFrequencyControllerProvider);
      final remindMeBefore = ref.watch(remindMeBeforeControllerProvider);

      final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
      final userId = authenticatorRepo.currentUser?.uid;
      CollectionReference events = FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .doc(userId)
          .collection(FirebaseCollectionName.events);

      DocumentReference docRef = events.doc();

      UserEvent userEvent = UserEvent(
        id: docRef.id,
        title: eventNameInputController.text,
        calendarCategory: calendarCategory,
        eventCategory: selectedCategory,
        isAllDay: isAllDay,
        startDate: currentEventDateTime.startDate,
        endDate: currentEventDateTime.endDate,
        location: eventLocationInputController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        repeatedFrequencyAt: repeatedFrequencyAt.toRecurrenceRule().toString(),
        remindMeBefore: remindMeBefore.fromStringToDouble,
        description: eventDescriptionController.text,
      );

      await docRef.set(userEvent.toJson());
      if (context.mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.eventCreatedSuccessfullyText,
            snackbarType: SnackbarType.success,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.eventCreatedFailedText,
            snackbarType: SnackbarType.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => addEvent(context, ref),
      child: Text(LocalizedKeys.createEventButtonText),
    );
  }
}
