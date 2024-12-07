import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_image_controller.g.dart';

@riverpod
class ProfileImageController extends _$ProfileImageController {
  static const int targetWidth = 120;
  static const int targetHeight = 120;

  @override
  FutureOr<String?> build() async {
    ref.cache();
    final userProfilePath = await fetchProfileImage();
    return userProfilePath;
  }

  Future<String?> fetchProfileImage() async {
    state = const AsyncValue.loading();

    try {
      final authProvider = ref.read(authStateControllerProvider);
      final userId = authProvider.value?.userId;

      if (userId == null) {
        return null;
      }

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('${FirebaseStorageName.userImages}/$userId');
      final result = await storageRef.listAll();

      if (result.items.isNotEmpty) {
        final imageUrl = await result.items.last.getDownloadURL();
        return imageUrl;
      } else {
        return null;
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
    return null;
  }

  Future<void> uploadProfileImage(
    XFile? pickedImage,
  ) async {
    state = const AsyncValue.loading();

    try {
      final authProvider = ref.read(authStateControllerProvider);
      final userId = authProvider.value?.userId;

      if (userId == null || pickedImage == null) {
        return;
      }

      // Convert XFile to File and resize
      final File originalFile = File(pickedImage.path);
      final File resizedFile = await resizeImage(
        imageFile: originalFile,
        targetWidth: targetWidth,
        targetHeight: targetHeight,
      );

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = 'profile_$timestamp.jpg';
      final path = '${FirebaseStorageName.userImages}/$userId/$filename';
      final storageInstance = FirebaseStorage.instance.ref();
      final storageRef =
          storageInstance.child('${FirebaseStorageName.userImages}/$userId');

      // Check if there are any existing images in the storage
      final listResult = await storageRef.listAll();
      if (listResult.items.isNotEmpty) {
        await listResult.items.last.delete();
      }
      // Upload the new image
      final newImageStorageRef = storageInstance.child(path);
      final uploadTask = await newImageStorageRef.putFile(
        resizedFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {
            'width': '$targetWidth',
            'height': '$targetHeight',
          },
        ),
      );

      if (uploadTask.state == TaskState.success) {
        final newProfileImagePath = await newImageStorageRef.getDownloadURL();
        state = AsyncData(newProfileImagePath);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
    return;
  }
}
