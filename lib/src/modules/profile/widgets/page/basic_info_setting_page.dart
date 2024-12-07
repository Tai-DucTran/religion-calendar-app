import 'package:aries/aries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:religion_calendar_app/constants/constants.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/authenticator_repo.dart';
import 'package:religion_calendar_app/src/modules/authentication/repositories/repositories.dart';
import 'package:religion_calendar_app/src/modules/profile/controllers/profile_image_controller.dart';
import 'package:religion_calendar_app/src/modules/profile/widgets/widgets.dart';

class BasicInfoSettingPage extends ConsumerStatefulWidget {
  const BasicInfoSettingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BasicInfoSettingPageState();
}

class _BasicInfoSettingPageState extends ConsumerState<BasicInfoSettingPage> {
  XFile? pickedImage;

  Future<void> pickImageInGallery(String userId) async {
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
        'pick new file: $pickedFile';
        await profileImageController.uploadProfileImage(pickedImage);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<void> askPermissionAndPickImage(
    BuildContext context,
    String userId,
  ) async {
    final status = await Permission.photos.status;

    if (status.isGranted) {
      await pickImageInGallery(userId);
    } else if (status.isDenied) {
      final result = await Permission.photos.request();
      if (result.isGranted) {
        await pickImageInGallery(userId);
      }
    } else if (status.isPermanentlyDenied) {
      if (context.mounted) {
        showAlertDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authenticator = ref.read(authenticatorRepositoryProvider);
    final userId = authenticator.currentUser?.uid;

    return SettingPageTemplate(
      header: LocalizedKeys.editUserInfoButtonText,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenConfig.defaultHorizontalScreenPadding,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  ProfileImage(),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () async {
                        await askPermissionAndPickImage(context, userId ?? '');
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
            ),
            Spacing.sp30,
            Text(
              LocalizedKeys.firstNameAndLastName,
              style: AriesTextStyles.textBodyNormal,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}

showAlertDialog(context) => showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          LocalizedKeys.permissionDeninedText,
        ),
        content: Text(
          LocalizedKeys.grantAccessToPhotosText,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: Text(
              LocalizedKeys.cancelButtonText,
              style: TextStyle(
                color: AriesColor.neutral700,
              ),
            ),
            onPressed: () => context.pop(),
          ),
          CupertinoDialogAction(
            child: Text(
              LocalizedKeys.openSettingsButtonText,
              style: TextStyle(
                color: AriesColor.neutral700,
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
