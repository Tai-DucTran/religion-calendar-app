import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/calendar/models/models.dart';

class CreateEventButton extends ConsumerWidget {
  const CreateEventButton({
    super.key,
    required this.eventNameInputController,
    required this.eventDescriptionController,
  });

  final TextEditingController eventNameInputController,
      eventDescriptionController;

  Future<void> addEvent(BuildContext context) async {
    try {
      CollectionReference events = FirebaseFirestore.instance
          .collection('religions')
          .doc('catholicism')
          .collection('events');

      DocumentReference docRef = events.doc();

      UserEvent userEvent = UserEvent(
        id: docRef.id,
        title: eventNameInputController.text,
        calendarCategory: CalendarCategory.solar,
        eventCategory: EventCategory.religionEvent,
        isAllDay: true,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        location: "Church",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        remindMeBefore: 0.0,
        repeatedFrequencyAt: "DOES_NOT_REPEAT",
      );

      await docRef.set(userEvent.toJson());
      print('Add event success with ID: ${docRef.id}');

      if (context.mounted) {
        Navigator.of(context).pop(true); // Close modal and return true
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Event created successfully!')),
        );
      }

    } catch (e) {
      print('Can not add event: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => addEvent(context),
      child: const Text("Create event"),
    );
  }
}
