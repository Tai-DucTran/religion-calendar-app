import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';
import 'package:religion_calendar_app/src/modules/authentication/widgets/login/organisms/organisms.dart';
import 'package:religion_calendar_app/src/widgets/custom_elevated_button.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authStateControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Login Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomElevatedButton(
                text: provider.maybeWhen(
                    data: (data) =>
                        (data.userId != null ? 'Sign Out' : 'Not login yet'),
                    loading: () => 'Processing ...',
                    orElse: () => 'Something weird is happening...'),
                onPressed: () async {
                  final controller =
                      ref.read(authStateControllerProvider.notifier);
                  await controller.logOut();
                },
                marginHorizontal: 30,
                buttonColor: Colors.blue[400],
                textColor: Colors.white,
              ),
              Spacing.sp12,
              const SocialLoginButtonsSection()
            ],
          ),
        ),
      ),
    );
  }
}
