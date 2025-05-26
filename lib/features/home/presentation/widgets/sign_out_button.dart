import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/button/bottom_sheet_custom_button_w_icon.dart';
import '../../../../service_locator.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/navigator/strings.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../auth/domain/usecases/sign_out.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetCustomButtonWIcon(
      path: ImagesPath.logoutIcon,
      title: 'Sign Out',
      colors: [
        AppColors.buttonBgColor.withAlpha(210),
        AppColors.secondaryColor.withAlpha(100),
        AppColors.infoColor.withAlpha(220),
      ],
      onPressed: () async {
        await serviceLocator<SignOutUseCase>().call();
        if (context.mounted) {
          context.go(
            NavigatorPath.login,
          );
        }
      },
    );
  }
}
