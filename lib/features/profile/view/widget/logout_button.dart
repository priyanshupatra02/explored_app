import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/local_storage/app_storage_pod.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryActionButton(
      labelText: 'Log Out',
      isIcon: true,
      icon: const Icon(
        Icons.logout,
        color: AppColors.kLightSecondaryColor,
      ),
      onPressed: () {
        showAdaptiveDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => context.maybePop(),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () async {
                    final appStorage = ref.watch(appStorageProvider);
                    final box = appStorage.appBox;
                    await box?.clear();
                    ref.invalidate(appBoxProvider);
                    context.mounted ? context.router.replaceAll([const LoginRoute()]) : null;
                  },
                  child: const Text('Yes'),
                )
              ],
            );
          },
        );
      },
    );
  }
}
