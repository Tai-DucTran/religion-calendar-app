import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:religion_calendar_app/constants/firebase_image.dart';
import 'package:religion_calendar_app/src/modules/profile/controllers/profile_image_controller.dart';

class ProfileImage extends ConsumerWidget {
  const ProfileImage({
    super.key,
    this.imageSize = 44,
  });

  final double? imageSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImagePath = ref.watch(profileImageControllerProvider);
    return profileImagePath.when(
      data: (imageUrl) => CircleAvatar(
        radius: imageSize,
        backgroundColor: AriesColor.neutral30,
        backgroundImage: imageUrl != null
            ? NetworkImage(
                imageUrl,
              )
            : const NetworkImage(
                FirebaseImage.defaultUserProfileImage,
              ) as ImageProvider,
      ),
      loading: () => Skeletonizer(
        effect: const ShimmerEffect(
          baseColor: AriesColor.neutral30,
        ),
        enableSwitchAnimation: true,
        child: ClipOval(
          child: Container(
            width: imageSize! * 2,
            height: imageSize! * 2,
            color: AriesColor.neutral10,
          ),
        ),
      ),
      error: (error, stack) => CircleAvatar(
        radius: imageSize,
        child: Icon(
          Icons.error,
          color: AriesColor.danger200,
        ),
      ),
    );
  }
}
