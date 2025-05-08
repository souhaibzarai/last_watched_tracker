import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../common/widgets/text/custom_text.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../cubit/check_archive_cubit.dart';
import '../widgets/custom_sliver_media_details_header.dart';
import '../widgets/media_notes.dart';
import '../widgets/scrollable_media_details_section.dart';

class MediaDetailsPage extends StatelessWidget {
  const MediaDetailsPage({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomAppScaffold(
      child: BlocProvider<CheckArchiveCubit>(
        lazy: true,
        create:
            (context) =>
                CheckArchiveCubit()..setArchiveStatus(media.isArchived),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            CustomSliverMediaDetailsHeader(media: media),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(100),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor.withAlpha(180),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(media.title, size: 22),
                          ScrollableMediaDetailsSection(media: media),
                        ],
                      ),
                    ), //
                  ),
                ],
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
      ),
    );
  }
}
