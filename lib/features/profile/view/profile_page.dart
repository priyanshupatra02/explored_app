import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/local_storage/app_storage_pod.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/profile/controller/pod/delete_account_pod.dart';
import 'package:edtech_app/features/profile/controller/pod/is_account_delete_pod.dart';
import 'package:edtech_app/features/profile/view/widget/account_status.dart';
import 'package:edtech_app/features/profile/view/widget/logout_button.dart';
import 'package:edtech_app/features/profile/view/widget/profile_details.dart';
import 'package:edtech_app/features/profile/view/widget/profile_header.dart';
import 'package:edtech_app/shared/helper/global_helper.dart';
import 'package:edtech_app/shared/widget/buttons/secondary_action_button.dart';
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

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends ConsumerState<ProfileView>
    with TickerProviderStateMixin, GlobalHelper {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  deleteAccount() async {
    try {
      //show simple loading indicator
      showSimpleProgressIndicator(context: context);
      final success = await ref.read(deleteAccountProvider.notifier).deleteUserAccount();
      //hide loading indicator
      context.maybePop();

      // Show appropriate snackbar
      if (context.mounted) {
        if (success) {
          showSuccessSnack(
            child: Text('Account deleted successfully !'),
          );
          //cleaning local storage for data/caches
          final appStorage = ref.watch(appStorageProvider);
          final box = appStorage.appBox;
          await box?.clear();
          ref.invalidate(appBoxProvider);
          //navigating to onboarding screen
          if (context.mounted) {
            context.router.replaceAll([const LoginRoute()]);
          }
        } else {
          final error = ref.read(deleteAccountProvider).error;
          showErrorSnack(
            child: Text(error?.toString() ?? 'Something went wrong'),
          );
        }
      }
    } catch (e) {
      // Hide loading dialog if there's an error
      if (mounted) {
        context.maybePop();
        showErrorSnack(
          child: Text(e.toString()),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations
    _fadeController.forward();
    Future.delayed(Duration(milliseconds: 200), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  ProfileHeader(),
                  SizedBox(height: 40),
                  ProfileDetails(),
                  SizedBox(height: 32),
                  AccountStatus(),
                  SizedBox(height: 30),
                  LogoutButton(),
                  SizedBox(height: 10),
                  SecondaryActionButton(
                    labelText: 'Delete Account',
                    outlineColor: AppColors.kErrorColor,
                    labelTextColor: AppColors.kErrorColor,
                    isIcon: true,
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.kErrorColor,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                20.heightBox,
                                const Text(
                                  "Are you sure you want to delete this Account?",
                                  style: TextStyle(color: AppColors.kBlackColor),
                                ),
                                20.heightBox,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Consumer(
                                      builder: (context, ref, child) {
                                        final isAccountDelete = ref.watch(isAccountDeleteProvider);
                                        return Checkbox(
                                          activeColor: AppColors.kPrimaryColor,
                                          checkColor: AppColors.kGrey100,
                                          value: isAccountDelete,
                                          onChanged: (value) => ref
                                              .read(isAccountDeleteProvider.notifier)
                                              .state = value ?? false,
                                        );
                                      },
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "I understand that this action is irreversible. \nYour data will be deleted completely.",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(color: AppColors.kBlackColor),
                                      ),
                                    ),
                                  ],
                                ),
                                30.heightBox,
                                //delete account button
                                Consumer(
                                  builder: (context, ref, child) {
                                    final isAccountDelete = ref.watch(isAccountDeleteProvider);
                                    return SecondaryActionButton(
                                      onPressed: isAccountDelete ? deleteAccount : null,
                                      labelText: 'Delete Account',
                                    );
                                  },
                                ),
                                20.heightBox,
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
