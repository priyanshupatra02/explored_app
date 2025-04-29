import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/features/video_player/view/widget/chewie_demo.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideoPlayerPage extends StatelessWidget {
  final String videoTitle;
  final String videoUrl;
  final String videoId;
  final String whatYouWillLearn;
  const VideoPlayerPage({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
    required this.videoId,
  });

  @override
  Widget build(BuildContext context) {
    return VideoPlayerView(
      videoTitle: videoTitle,
      videoId: videoId,
      videoUrl: videoUrl, //TODO: make this dynamic
      whatYouWillLearn: whatYouWillLearn,
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final String videoId;
  final String whatYouWillLearn;
  const VideoPlayerView({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
    required this.videoId,
  });

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  Widget build(BuildContext context) {
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
                text: 'Watch \n',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              TextSpan(
                text: Algorithms.getFirstTwoWords(
                  'Video'.hardCoded,
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
      body: ChewieDemo(
        videoTitle: widget.videoTitle,
        videoUrl: widget.videoUrl,
        videoId: widget.videoId,
        whatYouWillLearn: widget.whatYouWillLearn,
      ),
    );
  }
}
