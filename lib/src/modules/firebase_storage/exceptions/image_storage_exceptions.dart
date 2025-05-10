class ImageStorageException implements Exception {
  final String message;
  final dynamic originalError;

  ImageStorageException(this.message, [this.originalError]);

  @override
  String toString() =>
      'ImageStorageException: $message${originalError != null ? '\nOriginal error: $originalError' : ''}';
}
