import 'dart:io';

import 'package:religion_calendar_app/src/utils/utils.dart';

void main() {
  const l10nFilePath = '.dart_tool/flutter_gen/gen_l10n/app_localizations.dart';
  const outputFilePath = 'lib/l10n/localized_keys.dart';

  final l10nFile = File(l10nFilePath);

  if (!l10nFile.existsSync()) {
    Log.error('Error: $l10nFilePath does not exist.');
    exit(1);
  }

  final l10nContent = l10nFile.readAsStringSync();
  final keys = extractKeys(l10nContent);
  final localizedKeysContent = generateLocalizedKeys(keys);

  final outputFile = File(outputFilePath);
  outputFile.writeAsStringSync(localizedKeysContent);

  Log.info('Success: localized_keys.dart has been generated.');
}

List<String> extractKeys(String content) {
  final regExp = RegExp(r'String get (\w+);');
  final matches = regExp.allMatches(content);
  return matches.map((match) => match.group(1)!).toList();
}

String generateLocalizedKeys(List<String> keys) {
  final buffer = StringBuffer();

  buffer.writeln('import \'package:flutter/material.dart\';');
  buffer.writeln(
      'import \'package:flutter_gen/gen_l10n/app_localizations.dart\';\n');
  buffer.writeln('class LocalizedKeys {');
  buffer.writeln('  LocalizedKeys._();\n');
  buffer.writeln('  static late BuildContext _context;\n');
  buffer.writeln('  static void setContext(BuildContext context) {');
  buffer.writeln('    _context = context;');
  buffer.writeln('  }\n');

  for (var key in keys) {
    buffer.writeln(
        '  static String get $key => AppLocalizations.of(_context)!.$key;');
  }

  buffer.writeln('}');

  return buffer.toString();
}
