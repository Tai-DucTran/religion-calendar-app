import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/calendar/widgets/widgets.dart';

// class EventLocationInput extends StatefulWidget {
//   const EventLocationInput({super.key});

//   @override
//   State<EventLocationInput> createState() => _EventLocationInputState();
// }

// class _EventLocationInputState extends State<EventLocationInput> {
//   TextEditingController locationController = TextEditingController();
//   void onTextChanged() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     locationController.addListener(onTextChanged);
//   }

//   @override
//   void dispose() {
//     locationController.removeListener(onTextChanged);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (locationController.text.isNotEmpty) ...[
//           Text(
//             LocalizedKeys.eventLocation,
//             style: AriesTextStyles.textBodySmall,
//           ),
//         ],
//         const Icon(
//           Icons.location_on_outlined,
//           color: AriesColor.neutral100,
//         ),
//         IntrinsicWidthTextField(
//           controller: locationController,
//           hintText: LocalizedKeys.eventLocationHint,
//           textFieldStyle: AriesTextStyles.textHeading6.copyWith(
//             color: AriesColor.yellowP300,
//           ),
//         ),
//       ],
//     );
//   }
// }

class EventLocationInput extends StatefulWidget {
  const EventLocationInput({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<EventLocationInput> createState() => _EventLocationInputState();
}

class _EventLocationInputState extends State<EventLocationInput> {
  // TextEditingController controller = TextEditingController();
  // void onTextChanged() {
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   locationController.addListener(onTextChanged);
  // }

  // @override
  // void dispose() {
  //   locationController.removeListener(onTextChanged);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // if (locationController.text.isNotEmpty) ...[
        //   Text(
        //     LocalizedKeys.eventLocation,
        //     style: AriesTextStyles.textBodySmall,
        //   ),
        // ],
        const Icon(
          Icons.location_on_outlined,
          color: AriesColor.neutral100,
        ),
        Spacing.sp8,
        Flexible(
          child: TextField(
            maxLines: null,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: LocalizedKeys.eventLocationHint,
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.normal, // Set the font weight to normal
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
