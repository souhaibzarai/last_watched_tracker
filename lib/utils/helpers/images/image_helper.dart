import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/images_path.dart';
import '../../theme/app_colors.dart';

class ImageHelper {
  ImageHelper._();

  static Widget getImage({required String imgUrl}) {
    final defaultImg = Image.asset(ImagesPath.defaultImg, fit: BoxFit.cover);
    if (imgUrl == 'null' || imgUrl.isEmpty) {
      return defaultImg;
    } else {
      return CachedNetworkImage(
        imageUrl: imgUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        fadeInCurve: Curves.easeIn,
        placeholder:
            (context, url) => Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textColor),
                strokeWidth: 3.0,
                backgroundColor: AppColors.primaryColor.withAlpha(100),
              ),
            ),
        errorWidget: (context, url, error) => defaultImg,
      );
    }
  }
}
