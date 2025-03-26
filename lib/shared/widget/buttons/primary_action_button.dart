import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:edtech_app/shared/widget/custom_loaders/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///use this as an replacement to elevated/elevated(icon) button
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    this.borderRadius,
    required this.labelText,
    required this.onPressed,
    this.isLoading = false,
    this.color = AppColors.kPrimaryColor,
    this.freeSize = false,
    this.fontSize = 12,
    this.isCTA = false,
    this.icon = const Icon(Icons.download_rounded),
    this.isIcon = false,
    this.isButtonActive,
    this.height,
    this.width,
    this.child,
    this.shape,
  });
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;
  final bool freeSize;
  final bool isCTA;
  final Widget? icon;
  final bool isIcon;
  final double fontSize;
  final bool? isButtonActive;
  final Widget? child;
  final OutlinedBorder? shape;
  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
              ),
          backgroundColor: color,
          disabledBackgroundColor: AppColors.kGrey400,
          minimumSize: freeSize
              ? const Size(0, 0)
              : Size(
                  width ?? double.maxFinite,
                  height ?? MediaQuery.of(context).size.height * 0.05,
                ),
        ),
        icon: icon!,
        iconAlignment: IconAlignment.end,
        label: Text(
          labelText,
          style: const TextStyle(
            letterSpacing: 0.5,
            color: AppColors.kLightSecondaryColor,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
          backgroundColor: color,
          disabledBackgroundColor: AppColors.kGrey400,
          minimumSize: freeSize
              ? const Size(0, 0)
              : Size(
                  width ?? double.infinity,
                  height ?? MediaQuery.of(context).size.height * 0.05,
                ),
        ),
        child: <Widget>[
          if (isLoading)
            AppLoader(
              androidBgColor: AppColors.kLightSecondaryColor,
              iosBgColor: AppColors.kLightSecondaryColor,
            ),
          5.widthBox,
          Text(
            labelText,
            style: const TextStyle(
              color: AppColors.kLightSecondaryColor,
              letterSpacing: 0.5,
            ),
          ),
        ].hStack(alignment: MainAxisAlignment.center),
      );
    }
  }
}
