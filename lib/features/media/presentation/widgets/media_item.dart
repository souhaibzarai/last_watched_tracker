import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../common/widgets/button/slidable_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/images/image_helper.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import '../cubit/archive_media_cubit.dart';
import '../cubit/fetch_medias_cubit.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(media),
      direction: Axis.horizontal,
      closeOnScroll: true,
      startActionPane: ActionPane(
        dragDismissible: false,
        openThreshold: .1,
        closeThreshold: .15,
        extentRatio: .25,
        motion: DrawerMotion(),
        children: [
          SlidableButton(
            bgColor: AppColors.disabledColor,
            icon: Icons.edit_outlined,
            onClick: (context) {},
            label: 'Edit',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableButton(
            bgColor: AppColors.disabledColor,
            icon: Icons.more_horiz_outlined,
            onClick: (context) {},
            label: 'More',
          ),
          SlidableButton(
            bgColor: AppColors.slidableGreenColor,
            color: AppColors.textColor,
            icon:
                media.isArchived
                    ? Icons.unarchive
                    : CupertinoIcons.archivebox_fill,
            label: media.isArchived ? 'Unarchive' : 'Archive',
            onClick: (context) => toggleArchive(context, media),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ImageHelper.getImage(imgUrl: media.imgUrl.toString()),
                ),
                AppConstants.horizontalMediumSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        media.title,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        media.notes.toString(), //
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textColor.withAlpha(120),
                        ),
                      ),
                    ],
                  ),
                ),
                AppConstants.horizontalMediumSizedBox,
                Text(media.status),
              ],
            ),
          ),
          AppConstants.getMediaItemDivider(),
        ],
      ),
    );
  }
}

void toggleArchive(BuildContext context, MediaEntity media) async {
  final archiveCubit = context.read<ArchiveMediaCubit>();
  final fetchMediaCubit = context.read<FetchMediasCubit>();

  await archiveCubit.toggleArchive(media);
  await fetchMediaCubit.fetchMedias(showLoading: false);
}
