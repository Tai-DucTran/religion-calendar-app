import 'package:aries/aries.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyAMember extends StatelessWidget {
  const AlreadyAMember({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      margin: const EdgeInsets.only(top: 12),
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
            text: "Already a member? ",
            style: const TextStyle(
              color: AriesColor.neutral900,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: 'Log In',
                style: const TextStyle(
                  color: AriesColor.yellowP300,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Sign up tapped!');
                  },
              )
            ]),
      ),
    );
  }
}
