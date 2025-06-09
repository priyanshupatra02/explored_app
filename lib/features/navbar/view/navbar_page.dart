import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/blogs/view/blogs_page.dart';
import 'package:edtech_app/features/home/view/home_page.dart';
import 'package:edtech_app/features/navbar/controller/pod/navbar_selected_index_pod.dart';
import 'package:edtech_app/features/plan/view/subscription_plans_page.dart';
import 'package:edtech_app/features/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

@RoutePage(deferredLoading: true)
class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavbarView();
  }
}

class NavbarView extends ConsumerStatefulWidget {
  const NavbarView({super.key});

  @override
  ConsumerState<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends ConsumerState<NavbarView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List screen = [
    const HomePage(),
    const BlogsPage(),
    const ProfilePage(),
    // const ForumsPage(),
    const SubscriptionPlansPage(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer(
      builder: (context, ref, child) {
        final navbarSelectedIndexState = ref.watch(navbarSelectedIndexProvider);
        return Scaffold(
          body: PageView.builder(
            pageSnapping: false,
            itemCount: 1,
            itemBuilder: (context, index) {
              return screen[navbarSelectedIndexState];
            },
          ),
          // bottomNavigationBar: NavigationBar(
          //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,

          //   selectedIndex: navbarSelectedIndexState,
          //   onDestinationSelected: (selectedIndex) {
          //     ref.read(navbarSelectedIndexProvider.notifier).update((state) => selectedIndex);
          //   },
          //   destinations: [
          //     //home
          //     NavigationDestination(

          //       icon: SvgPicture.asset(R.ASSETS_ICON_HOME_UNSELECTEDfix)_ICON_SVG),
          //       selectedIcon: SvgPicture.asset(R.ASSETS_ICON_HOME_SELECTED_ICON_SVG),
          //       label: 'Home',
          //     ),
          //     //blogs
          //     NavigationDestination(
          //       icon: SvgPicture.asset(R.ASSETS_ICON_BLOGS_UNSELECTED_ICON_SVG),
          //       selectedIcon: SvgPicture.asset(R.ASSETS_ICON_BLOGS_SELECTED_ICON_SVG),
          //       label: 'Blogs',
          //     ),
          //     //profile
          //     NavigationDestination(
          //       icon: SvgPicture.asset(R.ASSETS_ICON_PROFILE_UNSELECTED_ICON_SVG),
          //       selectedIcon: SvgPicture.asset(R.ASSETS_ICON_PROFILE_UNSELECTED_ICON_SVG),
          //       label: 'Profile',
          //     ),
          //   ],
          // ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 50),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: GNav(
              rippleColor: AppColors.kGrey300,
              hoverColor: AppColors.kGrey100,
              haptic: true, // haptic feedback
              tabBorderRadius: 25,
              curve: Curves.easeIn, // tab animation curves
              duration: Duration(milliseconds: 250), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: AppColors.kLightSecondaryColor, // unselected icon color
              activeColor: AppColors.kPrimaryColor, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: AppColors.kGrey100, // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
              selectedIndex: navbarSelectedIndexState,

              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.kPrimaryColor,
                  ),
              onTabChange: (selectedIndex) {
                ref.read(navbarSelectedIndexProvider.notifier).update((state) => selectedIndex);
              },
              tabs: [
                GButton(
                  icon: AppIcons.strokeRoundedHome04,
                  text: 'Home',
                ),
                GButton(
                  icon: AppIcons.strokeRoundedLicense,
                  text: 'Blogs',
                ),
                GButton(
                  icon: AppIcons.strokeRoundedUser,
                  text: 'Profile',
                ),
                GButton(
                  icon: AppIcons.strokeRoundedComment01,
                  text: 'Forums',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
