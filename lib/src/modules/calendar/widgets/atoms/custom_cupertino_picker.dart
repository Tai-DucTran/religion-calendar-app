import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';

class CustomCupertinoPicker extends StatelessWidget {
  const CustomCupertinoPicker({
    super.key,
    required this.scrollController,
    required this.onSelectedItemChanged,
    required this.children,
  });

  final FixedExtentScrollController scrollController;
  final Function(int) onSelectedItemChanged;
  final List<Widget> children;

  static const double _itemExtent = 60.0;  // Adjust for proper spacing

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: scrollController,
      looping: false,
      itemExtent: _itemExtent,
      selectionOverlay: null,
      backgroundColor: AriesColor.transparent,
      squeeze: 1.1,  // Reduced squeeze for more natural spacing
      onSelectedItemChanged: onSelectedItemChanged,
      children: children,
    );
  }
}