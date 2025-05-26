import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_watched_tracker/common/widgets/button/bottom_sheet_custom_button_w_icon.dart';

import '../../../../common/widgets/button/custom_img_icon_button.dart';
import '../../../../common/widgets/image/custom_image_asset.dart';
import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/images_path.dart';
import '../../../../utils/helpers/images/image_helper.dart';
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
                            useSafeArea: true,
                            constraints: BoxConstraints(maxHeight: 400.h),
                            sheetAnimationStyle: AnimationStyle(
                              curve: Curves.elasticInOut,
                              duration: Duration(milliseconds: 300),
                            ),
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 6,
                                          sigmaY: 6,
                                        ),
                                        child: Container(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ).r,
                                      color: AppColors.previewTextBgColor,
                                    ),
                                    child: ListView.custom(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(10).r,
                                      keyboardDismissBehavior:
                                          ScrollViewKeyboardDismissBehavior
                                              .manual,
                                      childrenDelegate: SliverChildListDelegate(
                                        [const BottomSheetCustomButtonWIcon()],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              toolbarHeight: 400,
              automaticallyImplyLeading: false,
              flexibleSpace: ImageHelper.getImage(
                imgUrl: ImagesPath.splashImage,
              ),
            ),
            SliverAppBar(
              toolbarHeight: 400,
              automaticallyImplyLeading: false,
              flexibleSpace: ImageHelper.getImage(
                imgUrl: ImagesPath.splashImage,
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}
