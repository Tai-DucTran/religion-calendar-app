import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

Future<File> resizeImage({
  required File imageFile,
  int? targetWidth = 320,
  int? targetHeight = 320,
}) async {
  // Read image file
  final bytes = await imageFile.readAsBytes();
  final image = img.decodeImage(bytes);

  if (image == null) throw Exception('Failed to decode image');

  // Resize the image
  final resized = img.copyResize(
    image,
    width: targetWidth,
    height: targetHeight,
    interpolation: img.Interpolation.linear,
  );

  // Get temporary directory
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final targetPath = '$tempPath/resized_$timestamp.jpg';

  // Save the resized image
  final File resultFile = File(targetPath);
  await resultFile.writeAsBytes(img.encodeJpg(resized, quality: 85));

  return resultFile;
}
