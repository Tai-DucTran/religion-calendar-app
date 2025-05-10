import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:religion_calendar_app/src/utils/log.dart';

class PermissionHandlerDialog {
  static Future<void> showPermissionDialog({
    required BuildContext context,
    required String permissionTitle,
    required String permissionMessage,
  }) async {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          permissionTitle,
        ),
        content: Text(
          permissionMessage,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              context.l10n.cancelButtonText,
              style: TextStyle(
                color: AriesColor.neutral10,
              ),
            ),
            onPressed: () => context.pop(),
          ),
          CupertinoDialogAction(
            child: Text(
              context.l10n.openSettingsButtonText,
              style: TextStyle(
                color: AriesColor.neutral10,
              ),
            ),
            onPressed: () {
              context.pop();
              openAppSettings();
            },
          )
        ],
      ),
    );
  }

  /// Specialized method for photo permission dialog
  static Future<void> showPhotoPermissionDialog(BuildContext context) async {
    return showPermissionDialog(
      context: context,
      permissionTitle: context.l10n.permissionDeninedText,
      permissionMessage: context.l10n.grantAccessToPhotosText,
    );
  }

  /// Specialized method for camera permission dialog
  static Future<void> showCameraPermissionDialog(BuildContext context) async {
    return showPermissionDialog(
      context: context,
      permissionTitle: context.l10n.permissionDeninedText,
      permissionMessage: context.l10n.grantAccessToCameraText,
    );
  }

  /// Generic method to handle any permission request with appropriate dialogs
  static Future<bool> requestPermission({
    required BuildContext context,
    required Permission permission,
    String? permissionTitle,
    String? permissionMessage,
  }) async {
    try {
      // Check current status
      final status = await permission.status;

      if (status.isGranted) {
        // Permission is already granted
        return true;
      } else if (status.isDenied) {
        // Request permission
        final result = await permission.request();
        return result.isGranted;
      } else if (status.isPermanentlyDenied) {
        // Show dialog to open settings if permission is permanently denied
        if (context.mounted &&
            permissionTitle != null &&
            permissionMessage != null) {
          await showPermissionDialog(
            context: context,
            permissionTitle: permissionTitle,
            permissionMessage: permissionMessage,
          );
        }
        return false;
      }

      return false;
    } catch (e) {
      Log.error('Error requesting permission: $e');
      return false;
    }
  }

  /// Method to pick image with proper permission handling
  static Future<XFile?> pickImageWithPermission({
    required BuildContext context,
    required ImageSource source,
    Function(XFile?)? onImagePicked,
  }) async {
    try {
      final permission =
          source == ImageSource.camera ? Permission.camera : Permission.photos;

      // Default messages for permissions
      final title = context.l10n.permissionDeninedText;
      final message = source == ImageSource.camera
          ? context.l10n.grantAccessToCameraText
          : context.l10n.grantAccessToPhotosText;

      // Request permission
      final granted = await requestPermission(
        context: context,
        permission: permission,
        permissionTitle: title,
        permissionMessage: message,
      );

      if (granted) {
        final pickedFile = await ImagePicker().pickImage(source: source);

        if (onImagePicked != null) {
          onImagePicked(pickedFile);
        }

        return pickedFile;
      }

      return null;
    } catch (e) {
      Log.error('Error picking image: $e');
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(
    BuildContext context, {
    Function(XFile?)? onImagePicked,
  }) async {
    return pickImageWithPermission(
      context: context,
      source: ImageSource.gallery,
      onImagePicked: onImagePicked,
    );
  }
}
