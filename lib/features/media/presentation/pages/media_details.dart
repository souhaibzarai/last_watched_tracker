import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/colors/colors.dart';
import '../../../../utils/helpers/functions/functions.dart';
import '../../../../utils/helpers/numbers/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../data/models/archive.dart';
import '../../domain/entities/media.dart';
import '../cubit/check_archive_cubit.dart';
import '../widgets/chapters_text_count.dart';
import '../widgets/media_notes.dart';
import '../widgets/media_status_percentage_bar.dart';
import '../widgets/media_text_preview.dart';
import '../widgets/media_title_preview.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          BlocProvider(
                            create:
                                (_) =>
                                    CheckArchiveCubit()
                                      ..setArchiveStatus(media.isArchived),
                            child: Builder(
                              builder: (context) {
                                return CustomMediaDetailsButton(
                                  icon:
                                      context
                                                  .watch<CheckArchiveCubit>()
                                                  .state ==
                                              true
                                          ? Icons.unarchive
                                          : CupertinoIcons.archivebox_fill,
                                  onPressed: () {
                                    final checkCubit =
                                        context.read<CheckArchiveCubit>();
                                    final newStatus = checkCubit.state;
                                    FunctionsHelper.toggleArchive(
                                      context,
                                      ArchiveModel(
                                        id: media.id,
                                        status: newStatus,
                                      ),
                                    );
                                    checkCubit.setArchiveStatus(!newStatus);
                                  },
                                );
                              },
                            ),
                          ),
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

class ScrollableMediaDetailsSection extends StatelessWidget {
  const ScrollableMediaDetailsSection({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MediaTextPreview(
            text: media.category,
            color: AppColors.primaryColor,
            bgColor: AppColors.infoColor,
          ),
          AppConstants.horizontalSmallSizedBox,
          MediaTextPreview(
            text: media.status,
            bgColor: ColorsHelper.getStatusColor(media.status),
          ),
        ],
      ),
    );
  }
}
