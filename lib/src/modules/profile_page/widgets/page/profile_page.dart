import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:religion_calendar_app/src/modules/authentication/authentication.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authenticatorRepositoryProvider);
    final currentUser = authRepo.currentUser;
    final isVerifiedEmail = currentUser?.emailVerified;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Profile',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final authController =
                  ref.read(authStateControllerProvider.notifier);
              await authController.logOut();
            },
            child: const Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // #FFFFFF
              Color(0xFFFAF5E9), // #FAF5E9
              Color(0xFFF1E6C7), // #F1E6C7
            ],
            stops: [0.0, 0.695, 1.0], // Adjust the stops to match the design
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Is verified email? $isVerifiedEmail'),
            ],
          ),
        ),
      ),
    );
  }
}
