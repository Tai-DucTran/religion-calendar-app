// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const String _arbPath = 'lib/intl_files/l10n/';
const String _localizedKeysPath = '${_arbPath}localized_keys.json';

void main() async {
  // Load localized keys
  final localizedKeysFile = File(_localizedKeysPath);
  if (!localizedKeysFile.existsSync()) {
    print('localized_keys.json not found!');
    return;
  }

  final localizedKeys = json.decode(await localizedKeysFile.readAsString())
      as Map<String, dynamic>;

  final Map<String, dynamic> enContent = {"@@locale": "en"};
  final Map<String, dynamic> viContent = {"@@locale": "vi"};

  localizedKeys.forEach((key, value) {
    enContent[key] = value['en'];
    enContent['@$key'] = {"description": value['description']};

    viContent[key] = value['vi'];
    viContent['@$key'] = {"description": value['description']};
  });

  // Write to ARB files
  final enArbFile = File('${_arbPath}intl_en.arb');
  final viArbFile = File('${_arbPath}intl_vi.arb');

  await enArbFile
      .writeAsString(const JsonEncoder.withIndent('  ').convert(enContent));
  await viArbFile
      .writeAsString(const JsonEncoder.withIndent('  ').convert(viContent));

  print('intl_en.arb and intl_vi.arb updated successfully!');
}
