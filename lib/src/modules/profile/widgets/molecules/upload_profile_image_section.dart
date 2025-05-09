import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/modules/profile/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/profile/profile_page.dart';

class UploadProfileImageSection extends ConsumerStatefulWidget {
  const UploadProfileImageSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadProfileImageSectionState();
}

class _UploadProfileImageSectionState
    extends ConsumerState<UploadProfileImageSection> {
  XFile? pickedImage;

  Future<void> pickImageInGallery() async {
    final profileImageController =
        ref.read(profileImageControllerProvider.notifier);
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          pickedImage = pickedFile;
        });
        await profileImageController.uploadProfileImage(pickedImage);
      }
    } catch (e) {
      Log.error('Error picking image: $e');
    }
  }

  Future<void> askPermissionAndPickImage(BuildContext context) async {
    try {
      final status = await Permission.photos.status;

      if (status.isGranted) {
        await pickImageInGallery();
      } else if (status.isDenied) {
        await Future.delayed(const Duration(milliseconds: 100));
        final result = await Permission.photos.request();
        if (result.isGranted) {
          await pickImageInGallery();
        }
      } else if (status.isPermanentlyDenied) {
        if (context.mounted) {
          showAlertDialog(context);
        }
      }
    } catch (e) {
      Log.error('Error handling permission: $e');
    }
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
                await askPermissionAndPickImage(
                  context,
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

showAlertDialog(context) => showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          context.l10n.permissionDeninedText,
        ),
        content: Text(
          context.l10n.grantAccessToPhotosText,
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
