import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(5),
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
                      padding: const EdgeInsets.only(right: 3),
                      width: 40,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonBgColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 20,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
              if (title != null) AppConstants.verticalMediumSizedBox,
              if (title != null) Expanded(child: title!),
              if (actions != null) const Spacer(),
              if (actions != null) ...actions!,
            ], //
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
