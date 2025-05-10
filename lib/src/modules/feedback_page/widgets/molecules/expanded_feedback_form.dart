import 'dart:io';
import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_form_setting_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/widgets/atoms/atoms.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/firebase_storage.dart';
import 'package:religion_calendar_app/src/utils/utils.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class ExpandedFeedbackForm extends HookConsumerWidget {
  const ExpandedFeedbackForm({
    super.key,
    required this.isScreenShootFeedback,
  });

  final bool isScreenShootFeedback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFormSetting =
        ref.watch(feedbackFormSettingControllerProvider).feedback;
    final controller = ref.read(feedbackFormSettingControllerProvider.notifier);

    final isSubmitting = useState(false);
    final feedbackTextController = useTextEditingController();
    final selectedImage = useState<XFile?>(null);
    final isUploading = useState(false);
    final uploadedImageUrl =
        useState<String?>(feedbackFormSetting.feedbackImageUrl);
    final isFormValid =
        controller.isFormValid(feedbackText: feedbackTextController.text);

    return Column(
      children: [
        Divider(color: AriesColor.neutral20),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: FeedbackTypeButton(
                type: FeedbackType.bugReport,
                label: FeedbackType.bugReport.getLocalized(context),
                isSelected:
                    feedbackFormSetting.feedbackType == FeedbackType.bugReport,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: FeedbackTypeButton(
                type: FeedbackType.featureRecommendation,
                label: FeedbackType.featureRecommendation.getLocalized(context),
                isSelected: feedbackFormSetting.feedbackType ==
                    FeedbackType.featureRecommendation,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        FeedbackDetailsTextArea(
          feedbackTextController: feedbackTextController,
        ),
        SizedBox(height: 12.h),
        if (!isScreenShootFeedback && selectedImage.value != null ||
            uploadedImageUrl.value != null)
          Container(
            margin: EdgeInsets.only(bottom: 12.h),
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AriesColor.neutral10,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AriesColor.neutral40),
            ),
            child: Stack(
              children: [
                Center(
                  child: selectedImage.value != null
                      ? Image.file(
                          File(selectedImage.value!.path),
                          height: 140.h,
                          fit: BoxFit.contain,
                        )
                      : uploadedImageUrl.value != null
                          ? Image.network(
                              uploadedImageUrl.value!,
                              height: 140.h,
                              fit: BoxFit.contain,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    size: 48.sp,
                                    color: AriesColor.neutral300,
                                  ),
                                );
                              },
                            )
                          : const SizedBox(),
                ),
                Positioned(
                  top: 4.h,
                  right: 4.w,
                  child: InkWell(
                    onTap: () {
                      selectedImage.value = null;
                      uploadedImageUrl.value = null;
                      controller.updateFeedbackImage(null);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AriesColor.neutral0,
                        shape: BoxShape.circle,
                        border: Border.all(color: AriesColor.neutral40),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 14.sp,
                        color: AriesColor.neutral700,
                      ),
                    ),
                  ),
                ),
                // Loading overlay
                if (isUploading.value)
                  Positioned.fill(
                    child: Container(
                      color: AriesColor.neutral900.withValues(
                        alpha: 0.3,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: CustomElevatedButton(
                buttonColor:
                    isFormValid ? AriesColor.yellowP950 : AriesColor.neutral40,
                onPressedAsync: isFormValid
                    ? () async {
                        if (isSubmitting.value) return;
                        try {
                          isSubmitting.value = true;
                          final result = await controller.submitFeedback();
                          if (result != null && context.mounted) {
                            feedbackTextController.clear();
                            selectedImage.value = null;
                            uploadedImageUrl.value = null;

                            // Show success message with custom snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              getCustomSnackbar(
                                message: context.l10n.submittedSuccessfullyText,
                                snackbarType: SnackbarType.success,
                                context: context,
                              ),
                            );
                          }
                        } catch (e) {
                          // Show error message if submission fails
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              getCustomSnackbar(
                                message:
                                    context.l10n.submittingFeedbackErrorText,
                                snackbarType: SnackbarType.error,
                                context: context,
                              ),
                            );
                          }
                        } finally {
                          if (context.mounted) {
                            isSubmitting.value = false;
                          }
                        }
                      }
                    : null,
                height: 40,
                text: context.l10n.submitButtonText,
              ),
            ),
            if (!isScreenShootFeedback)
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AriesColor.yellowP50,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AriesColor.yellowP200),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      if (isUploading.value) return;
                      final pickedFile =
                          await PermissionHandlerDialog.pickImageFromGallery(
                        context,
                      );

                      if (pickedFile != null && context.mounted) {
                        selectedImage.value = pickedFile;

                        try {
                          isUploading.value = true;

                          final authRepo =
                              ref.read(authenticatorRepositoryProvider);
                          final userId = authRepo.userId;

                          if (userId != null) {
                            final imageRepo =
                                ref.read(firebaseImageRepositoryProvider);
                            final imageUrl = await imageRepo.uploadImage(
                              pickedImage: pickedFile,
                              imageType: ImageType.feedbackScreenshot,
                              userId: userId,
                              associatedId: null,
                              metadata: {
                                'purpose': 'feedback',
                                'feedbackType':
                                    feedbackFormSetting.feedbackType.toString(),
                              },
                            );

                            if (imageUrl != null && context.mounted) {
                              uploadedImageUrl.value = imageUrl;
                              controller.updateFeedbackImage(imageUrl);
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              getCustomSnackbar(
                                message: context.l10n.uploadingImageErrorText,
                                snackbarType: SnackbarType.error,
                                context: context,
                              ),
                            );
                          }
                        } finally {
                          isUploading.value = false;
                        }
                      }
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Center(
                      child: isUploading.value
                          ? SizedBox(
                              width: 16.h,
                              height: 16.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AriesColor.yellowP950,
                              ),
                            )
                          : Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 20.h,
                              color: AriesColor.yellowP950,
                            ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
