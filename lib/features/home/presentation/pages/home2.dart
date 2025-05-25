import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/features/home/presentation/widgets/custom_search_field.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';
import 'package:last_watched_tracker/utils/theme/app_colors.dart';

import '../../../../common/widgets/button/custom_img_icon_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/images_path.dart';
import '../cubit/user_info_cubit.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit()..getUserInfo(),
      child: CustomAppScaffold(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent.withAlpha(50),
              expandedHeight: 60,
              toolbarHeight: 40,
              collapsedHeight: 40,
              stretch: true,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CustomSearchField()),
                      AppConstants.horizontalSmallSizedBox,
                      CustomImgIconButton(
                        path: ImagesPath.menuIcon,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            elevation: 4,
                            // enableDrag: true,
                            // isScrollControlled: true,
                            useSafeArea: true,
                            isDismissible: false,
                            sheetAnimationStyle: AnimationStyle(
                              curve: Curves.elasticInOut,
                              duration: Duration(milliseconds: 500),
                            ),
                            backgroundColor: AppColors.buttonBgColor,
                            showDragHandle: true,
                            builder: (context) {
                              return Container();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}
