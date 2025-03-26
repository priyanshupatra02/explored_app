import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///use this as an replacement to outlined/outlined(icon) button
///
class TertiaryActionButton extends StatelessWidget {
  const TertiaryActionButton({
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
  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: freeSize
              ? const Size(0, 0)
              : Size(
                  width ?? double.maxFinite,
                  height ?? MediaQuery.of(context).size.height * 0.05,
                ),
        ),
        icon: icon!,
        label: Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 0.0,
          minimumSize: freeSize
              ? const Size(0, 0)
              : Size(
                  width ?? double.infinity,
                  height ?? MediaQuery.of(context).size.height * 0.05,
                ),
        ),
        child: <Widget>[
          if (isLoading) const CupertinoActivityIndicator(),
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ].hStack(alignment: MainAxisAlignment.center),
      );
    }
  }
}
