import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/constants/firebase_collection_name.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class DeleteConfirmation {
  static Future<void> deleteEvent(
      BuildContext context, WidgetRef ref, String eventId) async {
    try {
      final authenticatorRepo = ref.watch(authenticatorRepositoryProvider);
      final userId = authenticatorRepo.currentUser?.uid;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .doc(userId)
          .collection(FirebaseCollectionName.events)
          .doc(eventId);

      await documentReference.delete();
      if (context.mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.eventDeletedSuccessfullyText,
            snackbarType: SnackbarType.success,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.eventDeletedFailedText,
            snackbarType: SnackbarType.error,
          ),
        );
      }
    }
  }

  static void showDeleteConfirmation(
      BuildContext context, WidgetRef ref, String eventId) {
    final width = MediaQuery.of(context).size.width * 0.95;

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        width: width,
        padding: const EdgeInsets.only(bottom: 20),
        child: CupertinoActionSheet(
          title: Text(
            LocalizedKeys.deleteEventConfirmationQuestionText,
          ),
          actions: [
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                deleteEvent(
                  context,
                  ref,
                  eventId,
                );
              },
              child: Text(
                LocalizedKeys.deleteEventConfirmationText,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              LocalizedKeys.cancelButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
