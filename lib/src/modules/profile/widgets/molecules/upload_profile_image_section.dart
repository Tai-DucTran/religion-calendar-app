import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/src/modules/profile/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/profile/profile_page.dart';
import 'package:religion_calendar_app/src/widgets/dialogs/permission_handler_dialog.dart';

class UploadProfileImageSection extends ConsumerStatefulWidget {
  const UploadProfileImageSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadProfileImageSectionState();
}

class _UploadProfileImageSectionState
    extends ConsumerState<UploadProfileImageSection> {
  XFile? pickedImage;

  Future<void> handleProfileImageSelection(XFile? pickedFile) async {
    if (pickedFile == null) return;

    final profileImageController =
        ref.read(profileImageControllerProvider.notifier);

    setState(() {
      pickedImage = pickedFile;
    });

    await profileImageController.uploadProfileImage(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ProfileImage(),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () async {
                await PermissionHandlerDialog.pickImageFromGallery(
                  context,
                  onImagePicked: handleProfileImageSelection,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AriesColor.neutral30,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AriesIcons.edit01Icon,
                  height: 12.h,
                  width: 12.w,
                  colorFilter: ColorFilter.mode(
                    AriesColor.neutral90,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
