import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/resource.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/login/view/widget/login_tab.dart';
import 'package:edtech_app/features/login/view/widget/signup_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with SingleTickerProviderStateMixin {
  final loginFormKey = GlobalKey<FormBuilderState>();
  final updateFormKey = GlobalKey<FormBuilderState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
        centerTitle: true,
        title: Column(
          children: [
            // FlutterLogo(
            //   size: 50,
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                R.ASSETS_APP_ICON_EXPLORED_LOGO_JPEG,
                height: 60,
              ),
            ),
            8.heightBox,
            Text(
              'Welcome to ExploreEd',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            8.heightBox,
            Text(
              'Login or signup to manage your account.',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
            20.heightBox,
            TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.kPrimaryColor,
              labelColor: AppColors.kPrimaryColor,
              unselectedLabelColor: Colors.grey,
              overlayColor: WidgetStateProperty.all(Colors.transparent), //onclick tabcolor
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            //login tab body
            LoginTab(
              loginFormKey: loginFormKey,
            ),
            //signup tab body
            SignupTab(
              updateFormKey: updateFormKey,
            ),
          ],
        ),
      ),
    );
  }
}
