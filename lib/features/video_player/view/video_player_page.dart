import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/custom_loaders/app_loader.dart';
import 'package:edtech_app/shared/widget/horizontal_divider_widget.dart';
import 'package:edtech_app/shared/widget/string_bullet_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoPlayerPage extends StatelessWidget {
  final String videoTitle;
  final String videoUrl;
  final List<String> whatYouWillLearn;
  const VideoPlayerPage({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
  });

  @override
  Widget build(BuildContext context) {
    return VideoPlayerView(
      videoTitle: "Mastering Vocabulary: Proven Strategies for Efficient wording",
      videoUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      whatYouWillLearn: whatYouWillLearn,
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final List<String> whatYouWillLearn;
  const VideoPlayerView(
      {super.key,
      required this.videoTitle,
      required this.videoUrl,
      required this.whatYouWillLearn});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  // late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(
  //       Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
      //   body: Center(
      //     child: _controller.value.isInitialized
      //         ? AspectRatio(
      //             aspectRatio: _controller.value.aspectRatio,
      //             child: VideoPlayer(_controller),
      //           )
      //         : Container(),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         _controller.value.isPlaying ? _controller.pause() : _controller.play();
      //       });
      //     },
      //     child: Icon(
      //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //     ),
      //   ),
      body: ChewieDemo(
        videoTitle: widget.videoTitle,
        videoUrl: widget.videoUrl,
        whatYouWillLearn: widget.whatYouWillLearn,
      ),
    );
  }
}

class ChewieDemo extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final List<String> whatYouWillLearn;
  const ChewieDemo({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
  });

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
    );
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay: bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 1),
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      placeholder: Container(
        color: Colors.transparent,
      ),
      // autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.252,
          child: Center(
            child: _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(controller: _chewieController!)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLoader(),
                      20.heightBox,
                      Text('Loading Your Video'),
                    ],
                  ),
          ),
        ),
        20.heightBox,
        Text(
          widget.videoTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
        ).px24(),
        16.heightBox,
        Row(
          children: [
            Text(
              'Basic',
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
              '${_videoPlayerController1.value.duration.inMinutes}:${_videoPlayerController1.value.duration.inSeconds.remainder(60)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Spacer(),
            HugeIcon(
              icon: AppIcons.strokeRoundedHeartAdd,
              color: AppColors.kPrimaryColor,
              size: 20,
            )
          ],
        ).px24(),
        HorizontalDividerWidget().pSymmetric(h: 24, v: 12),
        Text(
          "What you'll learn -",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
        ).px24().objectCenterLeft(),
        4.heightBox,
        StringBulletList(items: widget.whatYouWillLearn).px32(),
        30.heightBox,
        PrimaryActionButton(
          labelText: 'Take Quiz',
          isIcon: true,
          icon: HugeIcon(
            icon: AppIcons.strokeRoundedArrowRight02,
            color: AppColors.kLightSecondaryColor,
          ),
          onPressed: () {
            // if (loginFormKey.currentState!.validate()) {}
          },
        ).px32(),
      ],
    );
  }
}
