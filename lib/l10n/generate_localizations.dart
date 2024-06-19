// ignore_for_file: avoid_print


// import 'dart:io';


// const String _arbPath = 'lib/l10n/';
// const String _localizationsPath = '${_arbPath}localizations.dart';


// void main() async {
//   try {
//     final localizations = await _createLocalizationsFile();
//     print('');


//     await dartFormat();
//     await _dartFix();
//     await dartFormat();


//     print('Successfully generated $_localizationsPath');
//   } on Exception catch (e) {
//     throw Exception('Error generating files: $e');
//   }
// }


// Future<void> dartFormat() async {
//   final format = await Process.run(
//     'dart',
//     ['format', '.'],
//     workingDirectory: 'lib/src/icon/',
//   );
//   print(format.stdout);
// }


// Future<void> _dartFix() async {
//   final fixTrailingCommas = await Process.run(
//     'dart',
//     ['fix', '--apply'],
//     workingDirectory: 'lib/src/icon',
//   );
//   print(fixTrailingCommas.stdout);
// }


// Future<List<Map<String, String>>> _createLocalizationsFile() async {
//   final localizationsFile = await File(_localizationsPath).create();
//   final localizationsSink = localizationsFile.openWrite()..write('''
// class AppLocalizations {
//   AppLocalizations._();


//   // Generated code: do not hand-edit.
//   // BEGIN GENERATED


// }
// ''');
// }
