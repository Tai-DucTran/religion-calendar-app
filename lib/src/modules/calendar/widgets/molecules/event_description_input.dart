import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';

// class EventDescriptionInput extends StatefulWidget {
//   const EventDescriptionInput({super.key});

//   @override
//   State<EventDescriptionInput> createState() => _EventDescriptionInputState();
// }

// class _EventDescriptionInputState extends State<EventDescriptionInput> {
//   TextEditingController eventDescriptionController = TextEditingController();
//   void onTextChanged() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     eventDescriptionController.addListener(onTextChanged);
//   }

//   @override
//   void dispose() {
//     eventDescriptionController.removeListener(onTextChanged);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.only(
//             right: 8.sp,
//           ),
//           child: Text(
//             'Description:',
//             style: AriesTextStyles.textHeading6.copyWith(
//               color: AriesColor.neutral800,
//             ),
//           ),
//         ),
//         Flexible(
//           child: CalendarTextField(
//             controller: eventDescriptionController,
//             hintText: 'Add event description...',
//           ),
//         ),
//       ],
//     );
//   }
// }

class EventDescriptionInput extends StatefulWidget {
  const EventDescriptionInput({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<EventDescriptionInput> createState() => _EventDescriptionInputState();
}

class _EventDescriptionInputState extends State<EventDescriptionInput> {
  TextEditingController eventDescriptionController = TextEditingController();
  void onTextChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    eventDescriptionController.addListener(onTextChanged);
  }

  @override
  void dispose() {
    eventDescriptionController.removeListener(onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.text_justifyleft,
          color: AriesColor.neutral100,
        ),
        Spacing.sp8,
        Flexible(
          child: TextField(
            controller: widget.controller,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Description',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.normal, // Set the font weight to normal
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        // Flexible(
        //   child: CalendarTextField(
        //     controller: eventDescriptionController,
        //     hintText: 'Add event description...',
        //   ),
        // ),
      ],
    );
  }
}
