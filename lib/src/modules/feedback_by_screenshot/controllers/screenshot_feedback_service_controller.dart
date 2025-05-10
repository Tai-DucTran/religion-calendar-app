import 'package:feedback/feedback.dart';
import 'package:religion_calendar_app/src/router/routes.dart';
import 'package:religion_calendar_app/src/utils/localization_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:religion_calendar_app/src/utils/log.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/controllers.dart';
import 'package:religion_calendar_app/src/modules/feedback_by_screenshot/controllers/screenshot_feedback_form_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/firebase_storage/firebase_storage.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/controllers/feedback_conversation_controller.dart';
import 'package:religion_calendar_app/src/modules/feedback_page/models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/widgets/snackbar/snackbar.dart';

part 'screenshot_feedback_service_controller.g.dart';

@Riverpod(keepAlive: true)
class ScreenshotFeedbackService extends _$ScreenshotFeedbackService {
  @override
  void build() {}

  void showFeedbackForm() {
    final context = rootKey.currentContext;
    if (context != null) {
      // Make sure form is in a fresh state before showing
      ref.read(feedbackFormSettingControllerProvider.notifier).resetForm();

      ref
          .read(
            screenshotFeedbackFormControllerProvider.notifier,
          )
          .showFeedbackForm();

      BetterFeedback.of(context).show((feedback) {
        ref
            .read(
              screenshotFeedbackFormControllerProvider.notifier,
            )
            .hideFeedbackForm();

        _processFeedback(feedback);
      });
    } else {
      Log.error('Cannot show feedback form: context is null');
    }
  }

  Future<void> _processFeedback(UserFeedback feedback) async {
    try {
      Log.info('Processing feedback: ${feedback.text}');

      // Get current user info
      final authRepo = ref.read(authenticatorRepositoryProvider);
      final userId = authRepo.userId;
      final userName = authRepo.displayName;
      final userEmail = authRepo.email;

      if (userId == null || userId.isEmpty) {
        Log.error('Cannot process feedback: No user ID available');
        return;
      }

      // Get the feedback form settings to access selected type and sentiment
      final feedbackFormSetting =
          ref.read(feedbackFormSettingControllerProvider);
      final feedbackType =
          feedbackFormSetting.feedback.feedbackType ?? FeedbackType.bugReport;
      final sentiment = feedbackFormSetting.feedback.selectedSentiment;

      // First, save the screenshot to a temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFile = File(
          '${tempDir.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await tempFile.writeAsBytes(feedback.screenshot);

      // Create XFile from the temporary file
      final xFile = XFile(tempFile.path);

      // Upload the image to Firebase Storage
      final imageRepo = ref.read(firebaseImageRepositoryProvider);
      String? imageUrl;

      try {
        imageUrl = await imageRepo.uploadImage(
          pickedImage: xFile,
          imageType: ImageType.feedbackScreenshot,
          userId: userId,
          metadata: {
            'purpose': 'feedback',
            'feedbackSource': 'screenshot',
            'feedbackType': feedbackType.toString(),
          },
        );

        Log.info('Screenshot uploaded successfully: $imageUrl');
      } catch (e) {
        Log.error('Failed to upload screenshot: $e');
        // Continue with feedback even if image upload fails
      }

      // Create a feedback conversation object
      final feedbackId = const Uuid().v4();
      final now = DateTime.now();

      // Create the first message
      final message = FeedbackMessage(
        id: const Uuid().v4(),
        authorId: userId,
        authorName: userName,
        messageText: feedback.text,
        isFromTeam: false,
        createdAt: now,
      );

      // Create feedback conversation
      final feedbackConversation = FeedbackConversation(
        id: feedbackId,
        userId: userId,
        userDisplayName: userName,
        userEmail: userEmail,
        feedbackTitle:
            feedback.text, // Use the actual feedback text as the title
        feedbackType: feedbackType, // Use the selected feedback type
        selectedSentiment: sentiment, // Use the selected sentiment
        messages: [message],
        feedbackImageUrl: imageUrl,
        createdAt: now,
        updatedAt: now,
      );

      // Save the feedback conversation to Firestore
      final controller =
          ref.read(newFeedbackConversationControllerProvider.notifier);
      final String? conversationId =
          await controller.createFeedbackConversation(feedbackConversation);

      if (conversationId != null) {
        Log.info(
            'Screenshot feedback submitted successfully with ID: $conversationId');

        // Reset the form after successful submission
        ref.read(feedbackFormSettingControllerProvider.notifier).resetForm();

        // Show a success message if context is available
        final context = rootKey.currentContext;
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            getCustomSnackbar(
              message: context.l10n.submittedSuccessfullyText,
              snackbarType: SnackbarType.success,
              context: context,
            ),
          );
        }
      } else {
        Log.error('Failed to save screenshot feedback');
      }

      // Clean up temporary file
      await tempFile.delete();
    } catch (e) {
      Log.error('Error processing feedback: $e');

      // Show an error message if context is available
      final context = rootKey.currentContext;
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            message: context.l10n.submittingFeedbackErrorText,
            snackbarType: SnackbarType.error,
            context: context,
          ),
        );
      }
    }
  }
}
