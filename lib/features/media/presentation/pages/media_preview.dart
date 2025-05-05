import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/blured_bg_preview.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../widgets/chapters_text_count.dart';
import '../widgets/media_status_percentage_bar.dart';
import '../widgets/media_status_preview.dart';
import '../widgets/media_text_preview.dart';
import '../widgets/media_title_preview.dart';

class MediaDetailsPreview extends StatelessWidget {
  const MediaDetailsPreview({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext kContext) {
    return BluredBgPreview(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Image.network(
            media.imgUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 10,
            top: 10,
            child: MediaTextPreview(text: media.category),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -1,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: AppColors.primaryColor.withAlpha(180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediaPreviewTitle(media: media),
                      AppConstants.verticalVerySmallSizedBox,
                      MediaPreviewStatus(media: media),
                      AppConstants.verticalVerySmallSizedBox,
                      MediaStatusPercentageBar(media: media),
                      AppConstants.verticalSmallSizedBox,
                      ChaptersTextCount(media: media),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
