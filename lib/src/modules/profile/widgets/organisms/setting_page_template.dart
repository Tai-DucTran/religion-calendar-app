import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPageTemplate extends StatelessWidget {
  const SettingPageTemplate(
      {super.key, required this.child, required this.header});

  final Widget child;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AriesColor.yellowP50,
      appBar: AppBar(
        backgroundColor: AriesColor.yellowP50,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AriesColor.neutral700,
          ),
        ),
        title: Text(
          header,
          style: AriesTextStyles.textHeading6,
        ),
      ),
      body: child,
    );
  }
}
