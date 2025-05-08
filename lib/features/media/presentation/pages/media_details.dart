import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../cubit/check_archive_cubit.dart';
import '../widgets/chapters_text_count.dart';
import '../widgets/custom_floating_bottom_bar.dart';
import '../widgets/header_sliver_media_details.dart';
import '../widgets/media_notes.dart';
import '../widgets/media_status_percentage_bar.dart';
import '../widgets/scrollable_media_details_section.dart';

class MediaDetailsPage extends StatelessWidget {
  const MediaDetailsPage({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: BlocProvider<CheckArchiveCubit>(
        create:
            (context) =>
                CheckArchiveCubit()..setArchiveStatus(media.isArchived),
        child: Stack(
          children: [
            CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // Header
                HeaderSliverMediaDetails(media: media),
                // Image and title
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      // Image place
                      Hero(
                        tag: media,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 400,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                media.imgUrl, //
                              ),
                            ),
                          ),
                        ),
                      ),
                      // title placeholder
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          alignment: Alignment.bottomLeft,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black,
                                Colors.black54,
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(media.title, size: 22),
                              AppConstants.verticalVerySmallSizedBox,
                              SizedBox(
                                height: 30,
                                child: ScrollableMediaDetailsSection(
                                  media: media,
                                ),
                              ),
                            ],
                          ),
                        ), //
                      ),
                    ],
                  ),
                ),
                // Percentage bar and progress
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppConstants.smallPadding,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ChaptersTextCount(media: media), //
                          ],
                        ),
                        AppConstants.verticalVerySmallSizedBox,
                        MediaStatusPercentageBar(media: media),
                      ],
                    ),
                  ),
                ),
                //Notes Section
                if ((media.notes ?? '').isNotEmpty)
                  SliverToBoxAdapter(child: MediaNotes(media: media)),

                // Free spacing
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70,
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
            // Floating bottom nav bar BNB
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              height: 60,
              child: CustomFloatingBottomBar(media: media),
            ),
          ],
        ),
      ),
    );
  }
}
