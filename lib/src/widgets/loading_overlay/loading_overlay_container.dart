import 'dart:async';

import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/loading_overlay/model/loading_overlay.dart';

class LoadingOverlayContainer {
  LoadingOverlayContainer._();
  static final LoadingOverlayContainer _share = LoadingOverlayContainer._();
  factory LoadingOverlayContainer.instance() => _share;

  LoadingOverlayController? _controller;

  void show({
    required BuildContext context,
    String text = 'Loading',
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingOverlayController? showOverlay({
    required BuildContext context,
    String text = 'Loading',
  }) {
    final state = Overlay.of(context);

    final textController = StreamController<String>();
    textController.add(text);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: AriesColor.neutral50,
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.8,
                maxWidth: size.width * 0.8,
                minWidth: size.height * 0.5,
              ),
              decoration: BoxDecoration(
                color: AriesColor.neutral0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacing.sp12,
                      const CircularProgressIndicator(),
                      Spacing.sp12,
                      StreamBuilder<String>(
                        stream: textController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.requireData,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AriesColor.black,
                                  ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);
    return LoadingOverlayController(
      close: () {
        textController.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        textController.add(text);
        return true;
      },
    );
  }
}
