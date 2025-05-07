import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/numbers/percentage_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../cubit/check_archive_cubit.dart';
import '../widgets/chapters_text_count.dart';
import '../widgets/media_notes.dart';
import '../widgets/media_status_percentage_bar.dart';
import '../widgets/scrollable_media_details_section.dart';

class MediaDetailsPage extends StatelessWidget {
  const MediaDetailsPage({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverMediaNavBar(media: media),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppConstants.smallPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: media,
                    child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 80,
                      backgroundImage: NetworkImage(
                        media.imgUrl, //
                      ),
                    ),
                  ),
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
                  AppConstants.verticalSmallSizedBox,
                  BlocProvider(
                    create:
                        (context) =>
                            CheckArchiveCubit()
                              ..setArchiveStatus(media.isArchived),
                    child: ScrollableMediaDetailsSection(media: media),
                  ),
                ],
              ),
            ),
          ),
          if ((media.notes ?? '').isNotEmpty)
            SliverToBoxAdapter(child: MediaNotes(media: media)),

          SliverAppBar(
            toolbarHeight: 800,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

class SliverMediaNavBar extends StatelessWidget {
  const SliverMediaNavBar({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: CustomBackButton(),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: FlexibleSpaceBar(
            title: CustomText(
              media.title,
              color: AppColors.textColor,
              fw: FontWeight.w500,
            ),
            centerTitle: true,
            stretchModes: [
              StretchMode.fadeTitle, //
              StretchMode.zoomBackground,
            ],
          ),
        ),
      ),
    );
  }
}
