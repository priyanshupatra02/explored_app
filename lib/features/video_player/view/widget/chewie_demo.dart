import 'package:auto_route/auto_route.dart';
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
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerDemo extends StatefulWidget {
  final String videoTitle;
  final String videoUrl;
  final String videoDocumentId;
  final String whatYouWillLearn;
  final int videoId;
  const YouTubePlayerDemo({
    super.key,
    required this.videoTitle,
    required this.videoUrl,
    required this.whatYouWillLearn,
    required this.videoDocumentId,
    required this.videoId,
  });

  @override
  State<StatefulWidget> createState() {
    return _YouTubePlayerDemoState();
  }
}

class _YouTubePlayerDemoState extends State<YouTubePlayerDemo> {
  YoutubePlayerController? _youtubeController;
  bool _isPlayerReady = false;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  void initializePlayer() {
    try {
      // Use the provided YouTube URL or fallback to widget.videoUrl
      String videoUrl = "https://youtu.be/6stlCkUDG_s?list=PL4Gr5tOAPttLOY9IrWVjJlv4CtkYI5cI_";
      final videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? YoutubePlayer.convertUrlToId(widget.videoUrl);
      
      if (videoId == null || videoId.isEmpty) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Invalid YouTube URL';
        });
        return;
      }

      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false, // Changed to false to avoid SSL issues
          mute: false,
          loop: false, // Changed to false initially
          showLiveFullscreenButton: false,
          enableCaption: true,
          forceHD: false,
          useHybridComposition: true, // Added for better Android performance
        ),
      );
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Failed to initialize player: $e';
      });
    }
  }

  int currPlayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.252,
          child: _hasError || _youtubeController == null
              ? Container(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        16.heightBox,
                        Text(
                          _errorMessage.isNotEmpty ? _errorMessage : 'Video unavailable',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    setState(() {});
                  },
                  player: YoutubePlayer(
                    controller: _youtubeController!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: AppColors.kPrimaryColor,
                    progressColors: ProgressBarColors(
                      playedColor: AppColors.kPrimaryColor,
                      handleColor: AppColors.kPrimaryColor,
                    ),
                    onReady: () {
                      setState(() {
                        _isPlayerReady = true;
                      });
                    },
                    onEnded: (metaData) {
                      // Handle video end
                    },
                  ),
                  builder: (context, player) {
                    return !_isPlayerReady
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppLoader(),
                                20.heightBox,
                                Text('Loading Your Video'),
                              ],
                            ),
                          )
                        : player;
                  },
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
              _isPlayerReady && _youtubeController != null
                  ? '${_youtubeController!.metadata.duration.inMinutes}:${_youtubeController!.metadata.duration.inSeconds.remainder(60)}'
                  : '0:00',
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
                // final quizProgress = quizProgressModel.quizProgressData!.first.quizProgress;
                if (quizProgressModel.quizProgressData?.isEmpty == true) {
                  return Text('No Quiz Found For This Subject');
                } else {
                  return Column(
                    children: [
                      PrimaryActionButton(
                        labelText: 'Take Quiz',
                        isIcon: true,
                        icon: HugeIcon(
                          icon: AppIcons.strokeRoundedArrowRight02,
                          color: AppColors.kLightSecondaryColor,
                        ),
                        onPressed: () {
                          // if (loginFormKey.currentState!.validate()) {}
                          // ref.read(quizControllerProvider.notifier).fetchQuizData();
                          if (_youtubeController != null) {
                            _youtubeController!.pause();
                          }
                          context.navigateTo(
                            QuizRoute(
                              questionId: widget.videoDocumentId,
                              videoId: widget.videoId,
                              quizProgressDocumentId:
                                  quizProgressModel.quizProgressData?.first.documentId,
                            ),
                          );
                        },
                      ),
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
              },
            );
          },
        ).px32(),
        30.heightBox,
      ],
    );
  }
}
