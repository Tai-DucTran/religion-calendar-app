import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/exceptions/exceptions.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/models/models.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_image_repository.g.dart';

@riverpod
FirebaseImageRepository firebaseImageRepository(Ref ref) {
  return FirebaseImageRepository();
}

class FirebaseImageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage({
    required XFile? pickedImage,
    required ImageType imageType,
    required String userId,
    String? associatedId,
    Map<String, String>? metadata,
  }) async {
    try {
      if (userId.isEmpty) {
        throw ImageStorageException('User ID is required');
      }

      if (pickedImage == null) {
        throw ImageStorageException('No image provided');
      }

      final config = imageType.resizeConfig;
      final File originalFile = File(pickedImage.path);
      File processedFile;

      // Process the image according to the configuration
      if (config.width != null && config.height != null) {
        processedFile = await resizeImage(
          imageFile: originalFile,
          targetWidth: config.width!,
          targetHeight: config.height!,
        );
      } else {
        // Use original file if no resize needed
        processedFile = originalFile;
      }

      // Generate filename with timestamp for uniqueness
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final prefix = imageType.pathSegment;
      final idSegment = associatedId != null ? '_${associatedId}_' : '_';
      final filename = '$prefix$idSegment$timestamp.jpg';

      // Set up storage paths
      final basePath = '${FirebaseStorageName.userImages}/$userId';
      final fullPath = '$basePath/$filename';

      final storageInstance = _storage.ref();
      final baseStorageRef = storageInstance.child(basePath);

      // Handle specific image types
      if (imageType == ImageType.userProfile) {
        // Delete previous profile images
        await _deletePreviousImages(
          baseStorageRef: baseStorageRef,
          prefix: 'profile_',
        );
      }

      // Upload the new image
      final newImageStorageRef = storageInstance.child(fullPath);

      // Prepare metadata
      final customMetadata = <String, String>{
        'type': imageType.toString(),
        'uploadedAt': DateTime.now().toIso8601String(),
        if (config.width != null) 'width': '${config.width}',
        if (config.height != null) 'height': '${config.height}',
        if (associatedId != null) 'associatedId': associatedId,
      };

      // Add any additional metadata
      if (metadata != null) {
        customMetadata.addAll(metadata);
      }

      final uploadTask = await newImageStorageRef.putFile(
        processedFile,
        SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: customMetadata,
        ),
      );

      // Check for upload success
      if (uploadTask.state == TaskState.success) {
        return await newImageStorageRef.getDownloadURL();
      } else {
        throw ImageStorageException('Upload failed: ${uploadTask.state}');
      }
    } on FirebaseException catch (e) {
      throw ImageStorageException('Firebase error: ${e.message}', e);
    } catch (e) {
      throw ImageStorageException('Error uploading image', e);
    }
  }

  /// Deletes an image from Firebase Storage
  Future<bool> deleteImage({
    required String imageUrl,
    required String userId,
  }) async {
    try {
      if (userId.isEmpty) {
        throw ImageStorageException('User ID is required');
      }

      if (imageUrl.isEmpty) {
        throw ImageStorageException('Image URL is required');
      }

      // Get reference from URL
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
      return true;
    } on FirebaseException catch (e) {
      throw ImageStorageException('Firebase error: ${e.message}', e);
    } catch (e) {
      throw ImageStorageException('Error deleting image', e);
    }
  }

  Future<bool> deleteImagesByType({
    required String userId,
    required ImageType imageType,
  }) async {
    try {
      if (userId.isEmpty) {
        throw ImageStorageException('User ID is required');
      }

      final baseStoragePath = '${FirebaseStorageName.userImages}/$userId';
      final storageRef = _storage.ref().child(baseStoragePath);
      final result = await storageRef.listAll();

      final prefix = imageType.pathSegment;
      final imagesToDelete = result.items
          .where((item) => item.name.startsWith('${prefix}_'))
          .toList();

      if (imagesToDelete.isEmpty) {
        return true;
      }

      // Delete all matching images
      for (final image in imagesToDelete) {
        await image.delete();
      }

      return true;
    } on FirebaseException catch (e) {
      throw ImageStorageException('Firebase error: ${e.message}', e);
    } catch (e) {
      throw ImageStorageException('Error deleting images', e);
    }
  }

  Future<void> _deletePreviousImages({
    required Reference baseStorageRef,
    required String prefix,
  }) async {
    try {
      final listResult = await baseStorageRef.listAll();
      final imagesToDelete = listResult.items
          .where((item) => item.name.startsWith(prefix))
          .toList();

      if (imagesToDelete.isNotEmpty) {
        for (final image in imagesToDelete) {
          await image.delete();
        }
      }
    } catch (e) {
      Log.warn('Warning: Failed to delete previous images: $e');
    }
  }

  /// List all images for a user by type
  Future<List<String>> listImageUrls({
    required String userId,
    required ImageType imageType,
    int? limit,
  }) async {
    try {
      if (userId.isEmpty) {
        throw ImageStorageException('User ID is required');
      }

      final baseStoragePath = '${FirebaseStorageName.userImages}/$userId';
      final storageRef = _storage.ref().child(baseStoragePath);
      final result = await storageRef.listAll();

      final prefix = imageType.pathSegment;
      final filteredItems = result.items
          .where((item) => item.name.startsWith('${prefix}_'))
          .toList();

      // Sort by name (newest first, assuming timestamp naming)
      filteredItems.sort((a, b) => b.name.compareTo(a.name));

      // Apply limit if specified
      final limitedItems =
          limit != null && limit > 0 && limit < filteredItems.length
              ? filteredItems.sublist(0, limit)
              : filteredItems;

      // Get download URLs
      final urls = <String>[];
      for (final item in limitedItems) {
        final url = await item.getDownloadURL();
        urls.add(url);
      }

      return urls;
    } on FirebaseException catch (e) {
      throw ImageStorageException('Firebase error: ${e.message}', e);
    } catch (e) {
      throw ImageStorageException('Error listing images', e);
    }
  }
}
