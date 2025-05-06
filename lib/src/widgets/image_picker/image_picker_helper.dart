import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';

/// A utility class for handling image picking with proper permission handling
class ImagePickerHelper {
  /// Picks an image from the gallery with permission handling
  ///
  /// [context] - The BuildContext for showing dialogs
  /// [onImagePicked] - Callback when an image is successfully picked
  /// [l10n] - Optional localization object, will use context.l10n if not provided
  /// [source] - The source of the image (gallery or camera), defaults to gallery
  static Future<void> pickImage({
    required BuildContext context,
    required Function(XFile pickedFile) onImagePicked,
    dynamic l10n,
    ImageSource source = ImageSource.gallery,
  }) async {
    // Capture whether the context is mounted at the beginning
    bool isContextMounted = true;

    // Store translations early to avoid context access later
    final translations = l10n ?? context.l10n;

    try {
      // Check appropriate permission based on source
      final Permission permission =
          source == ImageSource.gallery ? Permission.photos : Permission.camera;

      final status = await permission.status;

      if (status.isGranted) {
        // Permission already granted, pick the image
        await _pickImageFrom(source, onImagePicked);
      } else if (status.isDenied) {
        // Request permission with a small delay to avoid UI event issues
        await Future.delayed(const Duration(milliseconds: 100));

        // Check if context is still valid before showing dialog
        if (!context.mounted) {
          isContextMounted = false;
          return;
        }

        // Show a custom dialog first to explain why we need permission
        bool? shouldRequest;
        try {
          shouldRequest = await showDialog<bool>(
            context: context,
            builder: (dialogContext) => CupertinoAlertDialog(
              title: Text(source == ImageSource.gallery
                  ? translations.photoPermissionRequiredText ??
                      'Photo Access Required'
                  : translations.cameraPermissionRequiredText ??
                      'Camera Access Required'),
              content: Text(source == ImageSource.gallery
                  ? translations.photoPermissionExplanationText ??
                      'We need access to your photos to upload an image.'
                  : translations.cameraPermissionExplanationText ??
                      'We need access to your camera to take a photo.'),
              actions: [
                CupertinoDialogAction(
                  child: Text(translations.cancelButtonText ?? 'Cancel'),
                  onPressed: () => Navigator.pop(dialogContext, false),
                ),
                CupertinoDialogAction(
                  child: Text(translations.allowButtonText ?? 'Allow'),
                  onPressed: () => Navigator.pop(dialogContext, true),
                ),
              ],
            ),
          );
        } catch (e) {
          // Dialog was probably dismissed due to context becoming invalid
          isContextMounted = false;
          Log.error('Dialog error: $e');
          return;
        }

        // Check if context is still valid and user requested permission
        if (shouldRequest == true) {
          final result = await permission.request();

          // Check again if the context is still mounted
          if (result.isGranted && isContextMounted && context.mounted) {
            await _pickImageFrom(source, onImagePicked);
          }
        }
      } else if (status.isPermanentlyDenied) {
        // Check if context is still valid before showing settings dialog
        if (isContextMounted && context.mounted) {
          await _showOpenSettingsDialog(context, translations);
        }
      }
    } catch (e) {
      Log.error('Error in image picker: $e');
    }
  }

  /// Internal method to pick image from specified source
  static Future<void> _pickImageFrom(
    ImageSource source,
    Function(XFile pickedFile) onImagePicked,
  ) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 80, // Moderate compression for faster uploads
      );

      if (pickedFile != null) {
        onImagePicked(pickedFile);
      }
    } catch (e) {
      Log.error('Error picking image: $e');
    }
  }

  /// Shows a dialog to open settings when permission is permanently denied
  static Future<void> _showOpenSettingsDialog(
      BuildContext context, dynamic translations) async {
    // We don't return anything here as we only use the context to show the dialog
    // and don't rely on the result for further context operations
    try {
      await showCupertinoDialog(
        context: context,
        builder: (BuildContext dialogContext) => CupertinoAlertDialog(
          title: Text(
            translations.permissionDeninedText ?? 'Permission Denied',
          ),
          content: Text(
            translations.grantAccessToPhotosText ??
                'Please open settings and grant the required permission.',
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: Text(
                translations.cancelButtonText ?? 'Cancel',
              ),
              onPressed: () => Navigator.pop(dialogContext),
            ),
            CupertinoDialogAction(
              child: Text(
                translations.openSettingsButtonText ?? 'Open Settings',
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                openAppSettings();
              },
            )
          ],
        ),
      );
    } catch (e) {
      // Dialog might have been dismissed due to context becoming invalid
      Log.error('Settings dialog error: $e');
    }
  }
}
