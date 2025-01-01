import 'package:flutter/material.dart';

@immutable
class LunarCellData {
  const LunarCellData({
    required this.formattedText,
    required this.isImportant,
  });

  final String formattedText;
  final bool isImportant;

  @override
  String toString() {
    return 'LunarCellData(formattedText: $formattedText, isImportant: $isImportant)';
  }
}
