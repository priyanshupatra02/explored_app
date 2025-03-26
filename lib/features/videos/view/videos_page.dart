import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:edtech_app/shared/widget/cache_network_image_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class VideosPage extends StatelessWidget {
  final String subject;

  const VideosPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return VideosView(
      subject: subject,
    );
  }
}

class VideosView extends StatefulWidget {
  final String subject;
  const VideosView({super.key, required this.subject});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final List<String> sampleItems = [
      'First bullet point',
      'Second bullet point',
      'Third bullet point',
    ];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: BackButtonWidget(),
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: 'Literature \n',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              TextSpan(
                text: Algorithms.getFirstTwoWords(
                  'videos'.hardCoded,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.navigateTo(
                VideoPlayerRoute(
                  videoTitle: "Mastering Vocabulary: Proven Strategies for Efficient wording",
                  videoUrl:
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
                  whatYouWillLearn: sampleItems,
                ),
              );
            },
            child: VideoCourseCard(
              title: "Mastering Vocabulary: Proven Strategies for Efficient wording",
              level: "Basic",
              duration: "10 min",
              isFavorite: _isFavorite,
              onFavoriteTap: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: VideoCourseCard(
      //     title: "Mastering Vocabulary: Proven Strategies for Efficient wording",
      //     level: "Basic",
      //     duration: "10 min",
      //     isFavorite: _isFavorite,
      //     onFavoriteTap: () {
      //       setState(() {
      //         _isFavorite = !_isFavorite;
      //       });
      //     },
      //   ),
      // ),
    );
  }
}

class VideoCourseCard extends StatelessWidget {
  final String title;
  final String level;
  final String duration;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const VideoCourseCard({
    super.key,
    required this.title,
    required this.level,
    required this.duration,
    this.isFavorite = false,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to make the widget responsive
    // final screenWidth = MediaQuery.of(context).size.width;
    // final isSmallScreen = screenWidth < 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.kSecondaryColor,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Course Image
                Stack(
                  children: [
                    // Image.network(
                    //   'assets/images/english_book.jpg', // Replace with your asset
                    //   fit: BoxFit.cover,
                    //   height: 180,
                    //   width: double.infinity,
                    //   errorBuilder: (context, error, stackTrace) {
                    //     return Container(
                    //       height: 180,
                    //       color: const Color(0xFFF5C518), // Yellow color from the image
                    //       child: Center(
                    //         child: Text(
                    //           'EVERYDAY\nENGLISH',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: isSmallScreen ? 24 : 32,
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    //video thumbnail
                    CacheNetworkImageWidget(
                      imageUrl:
                          'https://images.unsplash.com/photo-1543109740-4bdb38fda756?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    //play time widget
                    // Positioned(
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: Center(
                    //     child: Container(
                    //       width: 40,
                    //       height: 8,
                    //       decoration: BoxDecoration(
                    //         color: Colors.blue[700],
                    //         borderRadius: BorderRadius.circular(4),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // Course details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                level,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.kPrimaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              const Text(
                                " • ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                duration,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.kPrimaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          HugeIcon(
                            icon: AppIcons.strokeRoundedHeartAdd,
                            color: AppColors.kPrimaryColor,
                            size: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
