import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/bottom_sheet_custom_button_w_icon.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/navigator/strings.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../media/presentation/cubit/fetch_medias_cubit.dart';

class AddMediaModalButton extends StatelessWidget {
  const AddMediaModalButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetCustomButtonWIcon(
      path: ImagesPath.addIcon,
      color: AppColors.primaryColor,
      title: 'Add New Media',
      colors: [
        AppColors.buttonBgColor.withAlpha(210),
        AppColors.infoColor.withAlpha(220),
        AppColors.secondaryColor.withAlpha(100),
      ],
      onPressed: () async {
        final isMediaAdded = await context.push(
          NavigatorPath.addMedia,
        );

        if (isMediaAdded == true) {
          context.pop();
          return await context.read<FetchMediasCubit>().fetchMedias();
        } else
          return context.pop();
      },
    );
  }
}
