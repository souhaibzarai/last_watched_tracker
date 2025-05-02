import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:last_watched_tracker/common/widgets/button/slidable_button.dart';
import 'package:last_watched_tracker/features/media/domain/entities/media.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';
import 'package:last_watched_tracker/utils/helpers/images/image_helper.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({super.key, required this.mediaEntity});

  final MediaEntity mediaEntity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(mediaEntity),
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
        dismissible: DismissiblePane(
          onDismissed: () {},
          dismissThreshold: .7, //
        ),
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
            icon: CupertinoIcons.archivebox_fill,
            onClick: (context) {},
            label: 'Archive',
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
                  child: ImageHelper.getImage(
                    imgUrl: mediaEntity.imgUrl.toString(),
                  ),
                ),
                AppConstants.horizontalMediumSizedBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaEntity.title,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        mediaEntity.notes.toString(), //
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.secondaryColor.withAlpha(180),
                        ),
                      ),
                    ],
                  ),
                ),
                AppConstants.horizontalMediumSizedBox,
                Text(mediaEntity.status),
              ],
            ),
          ),
          AppConstants.getMediaItemDivider(),
        ],
      ),
    );
  }
}
