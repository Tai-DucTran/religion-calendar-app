import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:religion_calendar_app/l10n/localized_keys.dart';
import 'package:religion_calendar_app/src/modules/user/controllers/controllers.dart';
import 'package:religion_calendar_app/src/widgets/widgets.dart';

class UserNameTextField extends ConsumerStatefulWidget {
  const UserNameTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserNameTextFieldState();
}

class _UserNameTextFieldState extends ConsumerState<UserNameTextField> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();

  Future<void> updateBasicInfo() async {
    FocusScope.of(context).unfocus();
    try {
      final userController = ref.read(userControllerProvider.notifier);

      final result = await userController.updateBasicUserInfo(
        input: _userNameController.text,
      );

      if (result && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.profileUpdatedSuccessfullyText,
            snackbarType: SnackbarType.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          getCustomSnackbar(
            context: context,
            message: LocalizedKeys.profileUpdatedFailedText,
            snackbarType: SnackbarType.error,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userData = ref.read(userControllerProvider).valueOrNull?.user;
      if (userData != null) {
        _userNameController.text = userData.displayName ?? '';
        _userEmailController.text = userData.email ?? '';
      }
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldContainer(
          title: LocalizedKeys.userNameText,
          titleStyle: AriesTextStyles.textBodyNormal,
          textFieldColors: Colors.white,
          controller: _userNameController,
        ),
        Spacing.sp16,
        TextFormFieldContainer(
          title: LocalizedKeys.email,
          titleStyle: AriesTextStyles.textBodyNormal,
          textFieldColors: Colors.white,
          controller: _userEmailController,
          enable: false,
        ),
        Spacing.sp30,
        CustomElevatedButton(
          buttonColor: AriesColor.yellowP400,
          text: LocalizedKeys.saveButtonText,
          onPressed: updateBasicInfo,
          width: double.infinity,
        ),
      ],
    );
  }
}
