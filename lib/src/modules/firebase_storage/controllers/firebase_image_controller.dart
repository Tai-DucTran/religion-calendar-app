import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/models/models.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart'; // Add this import
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_image_controller.g.dart';

@riverpod
class FirebaseImageController extends _$FirebaseImageController {
  @override
  FutureOr<String?> build() async {
    ref.cache();
    return null;
  }

  Future<String?> fetchImage({required ImageType imageType}) async {
    state = const AsyncValue.loading();

    try {
      final authProvider = ref.read(authStateControllerProvider);
      final userId = authProvider.value?.userId;

      if (userId == null) {
        return null;
      }

      final baseStoragePath = '${FirebaseStorageName.userImages}/$userId';

      if (imageType == ImageType.userProfile) {
        final storageRef =
            FirebaseStorage.instance.ref().child(baseStoragePath);
        final result = await storageRef.listAll();

        final profileImages = result.items
            .where((item) => item.name.startsWith('profile_'))
            .toList();

        if (profileImages.isNotEmpty) {
          // Sort by name to get the most recent one (assuming timestamp in filename)
          profileImages.sort((a, b) => b.name.compareTo(a.name));
          final imageUrl = await profileImages.first.getDownloadURL();
          state = AsyncData(imageUrl);
          return imageUrl;
        }
      }
      // For feedback screenshots, we would need a conversation ID or similar to identify
      else if (imageType == ImageType.feedbackScreenshot) {}

      state = const AsyncData(null);
      return null;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

  // Upload an image with flexible configuration based on type
  Future<String?> uploadImage({
    required XFile? pickedImage,
    required ImageType imageType,
    String? associatedId,
  }) async {
    state = const AsyncValue.loading();
    String? uploadedImageUrl;

    try {
      final authProvider = ref.read(authStateControllerProvider);
      final userId = authProvider.value?.userId;

      if (userId == null || pickedImage == null) {
        return null;
      }

      final config = imageType.resizeConfig;

      final File originalFile = File(pickedImage.path);
      File processedFile;

      if (config.width != null && config.height != null) {
        processedFile = await resizeImage(
          imageFile: originalFile,
          targetWidth: config.width!,
          targetHeight: config.height!,
        );
      } else {
        processedFile = await compressImage(
          imageFile: originalFile,
          quality: config.quality ?? 1,
        );
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final prefix = imageType.pathSegment;
      final idSegment = associatedId != null ? '_${associatedId}_' : '_';
      final filename = '$prefix$idSegment$timestamp.jpg';

      final basePath = '${FirebaseStorageName.userImages}/$userId';
      final fullPath = '$basePath/$filename';

      final storageInstance = FirebaseStorage.instance.ref();
      final baseStorageRef = storageInstance.child(basePath);

      if (imageType == ImageType.userProfile) {
        final listResult = await baseStorageRef.listAll();
        final profileImages = listResult.items
            .where((item) => item.name.startsWith('profile_'))
            .toList();

        if (profileImages.isNotEmpty) {
          for (final image in profileImages) {
            await image.delete();
          }
        }
      }

      final newImageStorageRef = storageInstance.child(fullPath);
      final uploadTask = await newImageStorageRef.putFile(
        processedFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {
            'type': imageType.toString(),
            if (config.width != null) 'width': '${config.width}',
            if (config.height != null) 'height': '${config.height}',
            if (associatedId != null) 'associatedId': associatedId,
          },
        ),
      );

      if (uploadTask.state == TaskState.success) {
        uploadedImageUrl = await newImageStorageRef.getDownloadURL();

        // Update the user document in Firestore if this is a profile image
        if (imageType == ImageType.userProfile) {
          try {
            await _updateUserProfileImage(userId, uploadedImageUrl);
          } catch (e) {
            // If Firestore update fails, consider deleting the uploaded image
            // to maintain consistency
            await newImageStorageRef.delete().catchError(
                (e) => Log.error('Failed to clean up orphaned image'));
            state = AsyncError('Failed to update user profile in database',
                StackTrace.current);
            return null;
          }
        }

        state = AsyncData(uploadedImageUrl);
        return uploadedImageUrl;
      }

      return null;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      return null;
    }
  }

// In FirebaseImageController
  Future<void> _updateUserProfileImage(String userId, String imageUrl) async {
    try {
      // Instead of directly updating Firestore, use the UserController
      final userController = ref.read(userControllerProvider.notifier);
      await userController.updateProfileImageUrl(url: imageUrl);

      Log.info('User profile image updated: $imageUrl');
    } catch (error, stackTrace) {
      Log.error('Error updating user profile image',
          error: error, stackTrace: stackTrace);
    }
  }

  // Helper method to compress image without resizing
  Future<File> compressImage({
    required File imageFile,
    required double quality,
  }) async {
    try {
      // Read the file as bytes
      final Uint8List bytes = await imageFile.readAsBytes();

      // Decode the image
      final ui.Codec codec = await ui.instantiateImageCodec(bytes);
      final ui.FrameInfo frameInfo = await codec.getNextFrame();

      // Get the existing width and height
      final int width = frameInfo.image.width;
      final int height = frameInfo.image.height;

      // Now use the existing resizeImage function with original dimensions
      return await resizeImage(
        imageFile: imageFile,
        targetWidth: width,
        targetHeight: height,
      );

      // Note: Your existing resizeImage function doesn't seem to accept a quality parameter
      // If you want to add this functionality, you'll need to modify your resizeImage method
    } catch (e) {
      Log.error('Error compressing image: $e');
      // Return the original file if compression fails
      return imageFile;
    }
  }
}
