import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/numbers/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../widgets/archive_media_button.dart';
import '../widgets/chapters_text_count.dart';
import '../widgets/media_notes.dart';
import '../widgets/media_status_percentage_bar.dart';
import '../widgets/media_title_preview.dart';
import '../widgets/scrollable_media_details_section.dart';

class MediaDetailsPage extends StatelessWidget {
  const MediaDetailsPage({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: Column(
        children: [
          CustomBackButton(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppConstants.verticalSmallSizedBox,
                    Center(
                      child: Hero(
                        tag: media,
                        child: CircleAvatar(
                          minRadius: 80,
                          maxRadius: 120,
                          backgroundImage: NetworkImage(
                            media.imgUrl, //
                          ),
                        ),
                      ),
                    ),
                    AppConstants.verticalVerySmallSizedBox,
                    MediaPreviewTitle(media: media),
                    AppConstants.verticalSmallSizedBox,
                    ScrollableMediaDetailsSection(media: media),
                    AppConstants.verticalSmallSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChaptersTextCount(media: media),
                        CustomText(
                          '${PercentageHelper.getPercentage(media.progress, media.total)}%',
                          size: 12,
                          fw: FontWeight.w300,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                    AppConstants.verticalVerySmallSizedBox,
                    MediaStatusPercentageBar(media: media),
                    AppConstants.verticalMediumSizedBox,
                    if ((media.notes ?? '').isNotEmpty)
                      MediaNotes(media: media),
                    if ((media.notes ?? '').isNotEmpty)
                      AppConstants.verticalLargeSizedBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomMediaDetailsButton(
                            icon: CupertinoIcons.delete_solid,
                            color: AppColors.textColor,
                            bgColor: AppColors.errorColor,
                            onPressed: () {
                              print('Delete media');
                              if (context.canPop()) {
                                context.pop();
                              }
                            },
                          ),
                          AppConstants.horizontalMediumSizedBox,
                          CustomMediaDetailsButton(
                            bgColor: AppColors.infoColor,
                            color: AppColors.primaryColor,
                            icon: Icons.edit,
                            onPressed: () {
                              print('Update media');
                            },
                          ),
                          AppConstants.horizontalMediumSizedBox,
                          ArchiveMediaButton(media: media),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
