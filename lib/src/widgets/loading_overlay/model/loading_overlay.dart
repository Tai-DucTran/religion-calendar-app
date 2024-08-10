typedef CloseLoadingOverlay = bool Function();
typedef UpdateLoadingOverlay = bool Function(String text);

class LoadingOverlayController {
  final CloseLoadingOverlay close;
  final UpdateLoadingOverlay update;

  LoadingOverlayController({
    required this.close,
    required this.update,
  });
}
