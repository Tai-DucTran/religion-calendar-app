import 'package:flutter/material.dart';

class MainAppBackgroundContainer extends StatefulWidget {
  final Widget child;

  const MainAppBackgroundContainer({super.key, required this.child});

  @override
  State<MainAppBackgroundContainer> createState() =>
      _MainAppBackgroundContainerState();
}

class _MainAppBackgroundContainerState
    extends State<MainAppBackgroundContainer> {
  final GlobalKey _childKey = GlobalKey();
  bool _isScrollable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfScrollable();
    });
  }

  void _checkIfScrollable() {
    final RenderBox renderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox;
    final screenHeight = MediaQuery.of(context).size.height;
    final childHeight = renderBox.size.height;

    setState(() {
      _isScrollable = childHeight > screenHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF), // #FFFFFF
            Color(0xFFFAF5E9), // #FAF5E9
            Color(0xFFF1E6C7), // #F1E6C7
          ],
          stops: [0.0, 0.695, 1.0],
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: _isScrollable
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    key: _childKey,
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
