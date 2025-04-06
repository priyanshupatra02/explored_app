import 'package:cached_network_image/cached_network_image.dart';
import 'package:edtech_app/const/app_icons/app_icons.dart';
import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CacheNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Widget? placeholder;
  final BoxFit? fit;
  final double? borderRadius;
  const CacheNetworkImageWidget({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeholder = const Icon(Icons.image, size: 60, fill: 1, color: AppColors.kLightSecondaryColor),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            key: ValueKey(imageUrl),
            fit: fit,
            height: height,
            width: width,
            imageUrl: imageUrl!,
            placeholder: (context, url) => const Center(
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) =>  HugeIcon(
              icon: AppIcons.strokeRoundedWifiError02,
              color: AppColors.kGrey700,
            ),
          )
        :  HugeIcon(
            icon: AppIcons.strokeRoundedWifiError02,
            color: AppColors.kGrey700,
          );
  }
}
