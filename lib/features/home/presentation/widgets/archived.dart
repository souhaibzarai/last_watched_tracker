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
            splashColor: AppColors.buttonBgColor.withAlpha(60),
            highlightColor: AppColors.buttonBgColor.withAlpha(25),
            onTap: () {
              context.push(NavigatorPath.archive);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              padding: const EdgeInsets.all(5),
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
