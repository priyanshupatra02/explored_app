import 'package:auto_route/auto_route.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/core/router/router.gr.dart';
import 'package:edtech_app/features/videos/controller/pod/videos_by_subject_id_pod.dart';
import 'package:edtech_app/features/videos/view/widget/video_course_card.dart';
import 'package:edtech_app/shared/algorithms/algorithms.dart';
import 'package:edtech_app/shared/extension/app_extension.dart';
import 'package:edtech_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:edtech_app/shared/widget/buttons/back_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class VideosPage extends StatelessWidget {
  final String subject;
  final String subjectId;

  const VideosPage({super.key, required this.subject, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return VideosView(
      subject: subject,
      subjectId: subjectId,
    );
  }
}

class VideosView extends StatefulWidget {
  final String subject;
  final String subjectId;

  const VideosView({super.key, required this.subject, required this.subjectId});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  bool _isFavorite = false;
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
                text: '${widget.subject} \n',
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
      body: Consumer(
        builder: (context, ref, child) {
          final videosBySubjectIdAsync = ref.watch(videosBySubjectIdProvider(widget.subjectId));
          return videosBySubjectIdAsync.easyWhen(
            data: (videosListModel) {
              return videosListModel.videosList.isNotEmpty
                  ? ListView.builder(
                      itemCount: videosListModel.videosList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.navigateTo(
                              VideoPlayerRoute(
                                videoId: videosListModel.videosList[index].documentId,
                                videoTitle: videosListModel.videosList[index].name,
                                videoUrl: videosListModel.videosList[index].videoUrl,
                                whatYouWillLearn:
                                    videosListModel.videosList[index].subject.description,
                              ),
                            );
                          },
                          child: VideoCourseCard(
                            title: videosListModel.videosList[index].name,
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
                    )
                  : Center(
                      child: Text(
                        'No videos available\nfor this subject.',
                        textAlign: TextAlign.center,
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
