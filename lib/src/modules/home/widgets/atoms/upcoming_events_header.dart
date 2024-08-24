import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class UpComingEventsHeader extends StatelessWidget {
  const UpComingEventsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your events',
          style: AriesTextStyles.textHeading6,
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
              EdgeInsets.zero,
            ),
            minimumSize: WidgetStateProperty.all<Size>(
              Size.zero,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'View all',
            style: AriesTextStyles.textBodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AriesColor.yellowP500,
            ),
          ),
        ),
      ],
    );
  }
}
