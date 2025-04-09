import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:religion_calendar_app/src/widgets/markdown/markdown.dart';
import 'package:religion_calendar_app/src/widgets/skeletons/default_skeleton.dart';

class ReaderSkeleton extends StatelessWidget {
  const ReaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSkeleton(
      child: MarkdownReader(
        content: lorem(
          paragraphs: 3,
          words: 180,
        ),
      ),
    );
  }
}
