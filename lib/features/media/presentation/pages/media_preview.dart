import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/strings/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../widgets/media_status_preview.dart';
import '../widgets/media_text_preview.dart';
import '../widgets/media_title_preview.dart';

class MediaDetailsPreview extends StatelessWidget {
  const MediaDetailsPreview({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext kContext) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(kContext).size.height * .6,
          maxWidth: MediaQuery.of(kContext).size.width * .8,
        ),
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
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(media.title),
                        AppConstants.verticalSmallSizedBox,
                        Row(
                          children: [
                            MediaPreviewTitle(media: media),
                            const Spacer(),
                            MediaPreviewStatus(media: media),
                          ],
                        ),
                        AppConstants.verticalSmallSizedBox,
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            height: 10,
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: AppColors.previewTextBgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FractionallySizedBox(
                              widthFactor:
                                  (PercentageHelper.getPercentage(
                                        media.progress,
                                        media.total,
                                      ) /
                                      100),
                              alignment: Alignment.centerLeft,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppConstants.verticalSmallSizedBox,
                        (media.notes == null || media.notes!.isEmpty)
                            ? const SizedBox.shrink()
                            : CustomText(media.notes!, size: 14),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
