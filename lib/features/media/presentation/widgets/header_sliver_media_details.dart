import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/button/custom_back_button.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class HeaderSliverMediaDetails extends StatelessWidget {
  const HeaderSliverMediaDetails({super.key, required this.media});

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              clipBehavior: Clip.hardEdge,
              color: AppColors.buttonBgColor,
              borderRadius: BorderRadius.circular(12).r,
              child: const CustomBackButton(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
