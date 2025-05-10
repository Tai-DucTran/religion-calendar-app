import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';

import 'package:religion_calendar_app/src/modules/firebase_storage/models/models.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/repository/repository.dart';
import 'package:religion_calendar_app/src/modules/user/user.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_image_controller.g.dart';

@riverpod
class ProfileImageController extends _$ProfileImageController {
  @override
  FutureOr<String?> build() async {
    ref.cache();
    final authState = await ref.watch(authStateControllerProvider.future);
    return authState.profileImageUrl;
  }

  Future<void> uploadProfileImage(XFile? pickedImage) async {
    state = const AsyncValue.loading();

    try {
      if (pickedImage == null) {
        state = AsyncValue.data(state.value);
        return;
      }
      final authState = await ref.read(authStateControllerProvider.future);
      final userId = authState.userId;

      if (userId == null) {
        throw Exception('User ID is null, cannot upload profile image');
      }

      final repository = ref.read(firebaseImageRepositoryProvider);
      final imageUrl = await repository.uploadImage(
        pickedImage: pickedImage,
        imageType: ImageType.userProfile,
        userId: userId,
      );

      if (imageUrl == null) {
        throw Exception('Failed to get URL after upload');
      }

      final userController = ref.read(userControllerProvider.notifier);
      final success = await userController.updateProfileImageUrl(url: imageUrl);

      if (!success) {
        throw Exception('Failed to update user profile with new image URL');
      }

      state = AsyncData(imageUrl);
      Log.info('Profile image uploaded and user updated successfully');
    } catch (error, stackTrace) {
      Log.error('Failed to upload profile image',
          error: error, stackTrace: stackTrace);
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
