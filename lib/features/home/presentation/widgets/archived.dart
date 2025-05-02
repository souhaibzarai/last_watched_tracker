import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/navigator/strings.dart';
import '../../../../utils/theme/app_colors.dart';

class Archived extends StatelessWidget {
  const Archived({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: AppColors.buttonBgColor.withAlpha(120),
            splashColor: AppColors.buttonBgColor.withAlpha(77),
            highlightColor: AppColors.buttonBgColor.withAlpha(52),
            onTap: () {
              context.push(NavigatorPath.archive);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(5),
              child: CupertinoListTile(
                leading: Icon(
                  CupertinoIcons.archivebox,
                  color: AppColors.textColor,
                ),
                title: Text(
                  'Archived',
                  style: TextStyle(color: AppColors.textColor),
                ),
              ),
            ),
          ),
        ),
        AppConstants.getMediaItemDivider(), //
      ],
    );
  }
}
