import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

///use this as an replacement to outlined/outlined(icon) button
///
class SecondaryActionButton extends StatelessWidget {
  const SecondaryActionButton({
    super.key,
    this.borderRadius,
    required this.labelText,
    required this.onPressed,
    this.isLoading = false,
    this.outlineColor = AppColors.kPrimaryColor,
    this.freeSize = false,
    this.fontSize = 12,
    this.isCTA = false,
    this.icon = const Icon(Icons.download_rounded),
    this.isIcon = false,
    this.isButtonActive,
    this.height,
    this.width,
    this.labelTextColor,
  });
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? outlineColor;
  final bool freeSize;
  final bool isCTA;
  final Widget? icon;
  final bool isIcon;
  final double fontSize;
  final bool? isButtonActive;
  final Color? labelTextColor;
  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: outlineColor!,
          ),
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
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: labelTextColor,
          ),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: outlineColor!,
          ),
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
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: labelTextColor,
            ),
          ),
        ].hStack(alignment: MainAxisAlignment.center),
      );
    }
  }
}
