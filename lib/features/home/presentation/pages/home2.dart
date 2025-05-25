import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/button/custom_img_icon_button.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/theme/app_colors.dart';
import '../cubit/user_info_cubit.dart';
import '../widgets/custom_search_field.dart';

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
              expandedHeight: 60.h,
              toolbarHeight: 40.h,
              collapsedHeight: 40.h,
              stretch: true,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
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
                            useSafeArea: true,
                            isDismissible: true,
                            sheetAnimationStyle: AnimationStyle(
                              curve: Curves.elasticInOut,
                              duration: Duration(milliseconds: 500),
                            ),
                            backgroundColor: AppColors.buttonBgColor,
                            showDragHandle: true,
                            builder: (context) {
                              print(
                                '${MediaQuery.of(context).size.width} //  ${MediaQuery.of(context).size.height} ',
                              );
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
