import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/src/modules/calendar/controllers/controllers.dart';

class CreateEventButton extends ConsumerWidget {
  const CreateEventButton({
    super.key,
    required this.eventNameInputController,
    required this.eventDescriptionController,
  });

  final TextEditingController eventNameInputController,
      eventDescriptionController;

  void addEvent() async {
    try {
      FirebaseFirestore.instance.collection('events').add({
        'id': '',
        'title': eventNameInputController.text,
        'description': eventDescriptionController.text,
      });

      // CollectionReference events = FirebaseFirestore.instance
      //     .collection('religions') // Collection 'religions'
      //     .doc('catholicism') // Document 'catholicism'
      //     .collection('events'); // Collection 'events' trong 'catholicism'

      // UserEvent userEvent = UserEvent(
      //   id: '',
      //   title: eventNameInputController.text,
      //   calendarCategory: CalendarCategory.solar,
      //   eventCategory: EventCategory.religionEvent,
      //   isAllDay: true,
      //   startDate: DateTime(2024, 12, 25),
      //   endDate: DateTime(2024, 12, 25, 23, 59),
      //   location: "Church",
      //   createdAt: DateTime.now(),
      //   updatedAt: DateTime.now(),
      //   remindMeBefore: 1.0,
      //   repeatedFrequencyAt: "DOES_NOT_REPEAT",
      // );

      // Map<String, dynamic> eventData = userEvent.toJson();

      // await events.add({
      //   'id': '',
      //   'title': eventNameInputController.text,
      // });
      print('Add event success!');
    } catch (e) {
      print('Can not add event: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarCategory = ref.watch(calendarCategoryControllerProvider);
    return ElevatedButton(
      onPressed: () {
        try {
          FirebaseFirestore.instance.collection('events').add({
            'id': '',
            'title': eventNameInputController.text,
            'description': eventDescriptionController.text,
            'calendarCategory': calendarCategory,
          });
          print('Add event success!');
        } catch (e) {
          print('Can not add event: $e');
        }
      },
      child: const Text("Create event"),
    );
  }
}
