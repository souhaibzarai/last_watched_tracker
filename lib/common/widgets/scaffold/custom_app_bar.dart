import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/theme/app_colors.dart';
import '../../../utils/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.hideBackButton = true,
    this.actions,
    this.title,
  });

  final bool hideBackButton;
  final List<Widget>? actions;
  final Widget? title;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.primaryColor),
          padding: const EdgeInsets.all(5).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hideBackButton
                  ? SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Container(
                        padding: const EdgeInsets.only(right: 3).r,
                        width: 40.w,
                        height: 40.h,
                        alignment: AlignmentDirectional.center,
                        decoration: const BoxDecoration(
                          color: AppColors.buttonBgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20.sp,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
              if (title != null) AppConstants.verticalMediumSizedBox,
              if (title != null) Expanded(child: title!),
              if (actions != null) const Spacer(),
              ...?actions,
            ], //
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
