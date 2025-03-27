import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:religion_calendar_app/l10n/app_localizations.dart';

enum FAQsTitle {
  firstQuestion,
  secondQuestion,
  thirdQuestion,
  fourthQuestion,
  fifthQuestion,
}

extension FAQsTitleExtension on FAQsTitle {
  String getTitleLocalized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case FAQsTitle.firstQuestion:
        return l10n.firstQuestionInFAQsTitleText;
      case FAQsTitle.secondQuestion:
        return l10n.secondQuestionInFAQsTitleText;
      case FAQsTitle.thirdQuestion:
        return l10n.thirdQuestionInFAQsTitleText;
      case FAQsTitle.fourthQuestion:
        return l10n.fourthQuestionInFAQsTitleText;
      case FAQsTitle.fifthQuestion:
        return l10n.fifthQuestionInFAQsTitleText;
    }
  }

  String getAnswerLocalized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case FAQsTitle.firstQuestion:
        return l10n.firstAnswerInFAQsDescText;
      case FAQsTitle.secondQuestion:
        return l10n.secondAnswerInFAQsADescText;
      case FAQsTitle.thirdQuestion:
        return lorem(paragraphs: 2);
      case FAQsTitle.fourthQuestion:
        return lorem(paragraphs: 2);
      case FAQsTitle.fifthQuestion:
        return lorem(paragraphs: 2);
    }
  }
}
