import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../widgets/media_text_preview.dart';

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
              bottom: 100,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: AppColors.primaryColor.withAlpha(180),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: 1.5,
                                child: CustomText(media.title),
                              ),
                            ),
                            const Spacer(),
                            CustomText(
                              media.status,
                              size: 12,
                              fw: FontWeight.w300,
                              color: AppColors.secondaryColor,
                            ),
                          ],
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
