import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/blogs_details/controller/pod/text_magnifier_pod.dart';
import 'package:edtech_app/shared/animation/animated_paragraph.dart';
import 'package:edtech_app/shared/widget/app_icons_widget.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class BlogDetailsPage extends StatelessWidget {
  final String title;
  final String fullDescription;
  final String authorName;
  final String timeAgo;
  final String? authorImageUrl;
  const BlogDetailsPage({
    super.key,
    required this.title,
    required this.fullDescription,
    required this.authorName,
    required this.timeAgo,
    this.authorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlogDetailsView(
      title: title,
      fullDescription: fullDescription,
      authorName: authorName,
      timeAgo: timeAgo,
      authorImageUrl: authorImageUrl,
    );
  }
}

class BlogDetailsView extends ConsumerWidget {
  final String authorName;
  final String timeAgo;
  final String title;
  final String fullDescription;
  final String? authorImageUrl;
  const BlogDetailsView({
    super.key,
    required this.title,
    required this.fullDescription,
    required this.authorName,
    required this.timeAgo,
    this.authorImageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        actions: [
          AppIconsWidget(
            icon: HugeIcon(
              icon: AppIcons.strokeRoundedBookmarkAdd01,
              color: AppColors.kPrimaryColor,
            ),
          ).pOnly(right: 20),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
          fabButtons: <Widget>[
            GestureDetector(
              onTap: () {
                ref.read(textMagnifyProvider.notifier).magnifyText();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.kLightSecondaryColor,
                child: HugeIcon(
                  icon: AppIcons.strokeRoundedZoomInArea,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(textMagnifyProvider.notifier).minimizeText();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.kLightSecondaryColor,
                child: HugeIcon(
                  icon: AppIcons.strokeRoundedZoomOutArea,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.kLightSecondaryColor,
                child: HugeIcon(
                  icon: AppIcons.strokeRoundedShare05,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
          colorStartAnimation: AppColors.kSecondaryColor,
          colorEndAnimation: AppColors.kErrorColor,
          animatedIconData: AnimatedIcons.menu_close //To principal button
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Title
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimaryColor,
                ),
              ).objectCenterLeft(),
              Divider(
                height: 50,
                // thickness: 0.5,
                // indent: 10,
                endIndent: 330,
                color: AppColors.kPrimaryColor.withOpacity(0.3),
              ),
              // Author info row
              Row(
                children: [
                  // Author image
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: authorImageUrl != null ? NetworkImage(authorImageUrl!) : null,
                    backgroundColor: AppColors.kPrimaryColor,
                    child: authorImageUrl == null
                        ? const Icon(Icons.person, color: AppColors.kPrimaryWhiteColor)
                        : null,
                  ),
                  12.widthBox,
                  // Author name
                  Text(
                    authorName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      letterSpacing: 0.5,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  // Time ago
                  Text(
                    timeAgo,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      letterSpacing: 0.5,
                      color: AppColors.kGrey500,
                    ),
                  ),
                ],
              ),
              30.heightBox,
              // Description
              AnimatedParagraph(
                text: fullDescription,
                textStyle: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  letterSpacing: 0.5,
                  color: AppColors.kPrimaryColor,
                ),
                letterFadeDuration: const Duration(milliseconds: 200),
                letterDelay: const Duration(milliseconds: 30),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
