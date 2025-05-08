import 'package:flutter/material.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import 'archive_media_button.dart';

class CustomSliverMediaDetailsHeader extends StatelessWidget {
  const CustomSliverMediaDetailsHeader({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      forceMaterialTransparency: true,
      excludeHeaderSemantics: true,
      primary: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              clipBehavior: Clip.hardEdge,
              color: AppColors.buttonBgColor,
              borderRadius: BorderRadius.circular(12),
              child: const CustomBackButton(color: AppColors.primaryColor),
            ),
            Row(
              children: [
                ArchiveMediaButton(media: media),
                AppConstants.horizontalSmallSizedBox,
                CustomMediaDetailsButton(icon: Icons.menu, onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
