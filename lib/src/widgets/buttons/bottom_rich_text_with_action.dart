import 'package:aries/aries.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomRichTextWithAction extends StatelessWidget {
  const BottomRichTextWithAction(
      {super.key,
      required this.initialQuestion,
      required this.textSpan,
      required this.onTap});

  final String initialQuestion;
  final String textSpan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          text: initialQuestion,
          style: const TextStyle(
            color: AriesColor.neutral900,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: textSpan,
              style: const TextStyle(
                color: AriesColor.yellowP300,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            )
          ],
        ),
      ),
    );
  }
}
