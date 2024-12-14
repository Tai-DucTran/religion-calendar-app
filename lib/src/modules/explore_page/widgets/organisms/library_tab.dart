import 'package:aries/aries.dart';
import 'package:flutter/material.dart';

class LibraryTab extends StatelessWidget {
  const LibraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AriesColor.yellowP50,
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Center(
        child: Text(
          'Tab 2 Content',
        ),
      ),
    );
  }
}
