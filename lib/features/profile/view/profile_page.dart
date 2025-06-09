import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/core/local_storage/app_storage_pod.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileView();
  }
}

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: PrimaryActionButton(
          onPressed: () async {
            //cleaning local storage for data/caches
            final appStorage = ref.watch(appStorageProvider);
            final box = appStorage.appBox;
            await box?.clear();
            ref.invalidate(appBoxProvider);
            // ref.invalidate(userCurrentAddressDbServiceProvider);
            //navigating to onboarding screen
            context.mounted ? context.router.replaceAll([const LoginRoute()]) : null;
          },
          labelText: 'Logout',
        ).px64(),
      ),
    );
  }
}
