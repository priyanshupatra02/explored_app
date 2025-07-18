import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/quiz_progress/controller/pod/get_quiz_progress_pod.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/primary_action_button.dart';
import 'package:edtech_app/shared/widget/custom_loaders/app_loader.dart';
import 'package:edtech_app/shared/widget/horizontal_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class ChewieDemo extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final String videoDocumentId;
  final String whatYouWillLearn;
  final int videoId;
  const ChewieDemo({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
    required this.videoDocumentId,
    required this.videoId,
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
      Uri.parse(widget.videoUrl),
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
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimaryColor,
              ),
        ).px24().objectCenterLeft(),
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
        Text(
          widget.whatYouWillLearn,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.kPrimaryColor,
              ),
        ).px24().objectCenterLeft(),
        30.heightBox,
        //take quiz button
        Consumer(
          builder: (context, ref, child) {
            final quizProgressAsync = ref.watch(quizProgressProvider(widget.videoDocumentId));
            return quizProgressAsync.easyWhen(
              data: (quizProgressModel) {
                final quizProgress = quizProgressModel.quizProgressData!.first.quizProgress ?? [];

                return PrimaryActionButton(
                  labelText: 'Take Quiz',
                  isIcon: true,
                  icon: HugeIcon(
                    icon: AppIcons.strokeRoundedArrowRight02,
                    color: AppColors.kLightSecondaryColor,
                  ),
                  onPressed: () {
                    // if (loginFormKey.currentState!.validate()) {}
                    // ref.read(quizControllerProvider.notifier).fetchQuizData();
                    _chewieController?.pause().then(
                      (value) {
                        context.navigateTo(
                          QuizRoute(
                            questionId: widget.videoDocumentId,
                            videoId: widget.videoId,
                            quizProgressDocumentId:
                                quizProgressModel.quizProgressData?.first.documentId,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ).px32(),
        30.heightBox,
        //check quiz progress button
        PrimaryActionButton(
          labelText: 'Check Quiz Progress',
          isIcon: true,
          icon: HugeIcon(
            icon: AppIcons.strokeRoundedProgress04,
            color: AppColors.kLightSecondaryColor,
          ),
          onPressed: () {
            // talker.debug(widget.videoDocumentId);
            context.navigateTo(
              QuizProgressRoute(
                videoDocumentId: widget.videoDocumentId,
              ),
            );
          },
        ).px32(),
      ],
    );
  }
}
