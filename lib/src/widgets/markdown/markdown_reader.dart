import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownReader extends StatelessWidget {
  const MarkdownReader({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = AriesTextStyles.textBodyNormal;
    final h1Style = AriesTextStyles.textHeading4;
    final h2Style = AriesTextStyles.textHeading5;
    final h3Style = AriesTextStyles.textHeading6;

    return Markdown(
      data: content,
      styleSheet: MarkdownStyleSheet(
        h1: h1Style,
        h2: h2Style,
        h3: h3Style,
        p: baseTextStyle,
        listIndent: 20,
        a: baseTextStyle,
        blockquote: baseTextStyle,
        strong: baseTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
        pPadding: EdgeInsets.only(
          bottom: 12,
        ),
      ),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }
}
