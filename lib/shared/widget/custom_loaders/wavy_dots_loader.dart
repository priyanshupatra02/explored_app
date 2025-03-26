import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WavyDotsLoader extends StatelessWidget {
  final Color? loaderColor;
  const WavyDotsLoader({super.key, this.loaderColor});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: loaderColor ?? AppColors.kPrimaryWhiteColor,
      size: 10,
    );
  }
}
