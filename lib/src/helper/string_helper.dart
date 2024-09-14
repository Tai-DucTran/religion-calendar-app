extension StringCasingExtension on String {
  String toCapitalized() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

String? joinTwoString({
  required String? firstString,
  required String? secondString,
  String? separator = ' ',
}) {
  final ls = <String>[
    if (firstString != null && firstString.isNotEmpty) firstString,
    if (secondString != null && secondString.isNotEmpty) secondString,
  ];

  return ls.join('$separator');
}
