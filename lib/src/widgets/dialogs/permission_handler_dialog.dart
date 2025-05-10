// lib/src/utils/permission_handler_util.dart

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

  // Specialized method for photo permission dialog
  static Future<void> showPhotoPermissionDialog(BuildContext context) async {
    return showPermissionDialog(
      context: context,
      permissionTitle: context.l10n.permissionDeninedText,
      permissionMessage: context.l10n.grantAccessToPhotosText,
    );
  }

  // Complete image picking flow with permission handling
  static Future<XFile?> pickImageWithPermission({
    required BuildContext context,
    required ImageSource source,
  }) async {
    try {
      // Check permission status
      final Permission permission =
          source == ImageSource.camera ? Permission.camera : Permission.photos;

      final status = await permission.status;

      if (status.isGranted) {
        // Permission already granted, proceed with picking
        return await ImagePicker().pickImage(source: source);
      } else if (status.isDenied) {
        // Request permission
        await Future.delayed(const Duration(milliseconds: 100));
        final result = await permission.request();

        if (result.isGranted) {
          // Permission granted, proceed with picking
          return await ImagePicker().pickImage(source: source);
        }
      } else if (status.isPermanentlyDenied) {
        // Show dialog to open settings
        if (context.mounted) {
          if (source == ImageSource.camera) {
            await showPermissionDialog(
              context: context,
              permissionTitle: context.l10n.permissionDeninedText,
              permissionMessage: 'context.l10n.grantAccessToCameraText',
            );
          } else {
            await showPhotoPermissionDialog(context);
          }
        }
      }

      // Return null if permission not granted or image not picked
      return null;
    } catch (e) {
      Log.error('Error picking image: $e');
      return null;
    }
  }

  // Specialized method for gallery images
  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    return pickImageWithPermission(
      context: context,
      source: ImageSource.gallery,
    );
  }

  // Specialized method for camera images
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    return pickImageWithPermission(
      context: context,
      source: ImageSource.camera,
    );
  }
}
