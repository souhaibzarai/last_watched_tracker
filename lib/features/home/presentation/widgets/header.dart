import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/common/app_commons.dart';
import 'package:last_watched_tracker/common/cubit/button/button_state_cubit.dart';
import 'package:last_watched_tracker/common/widgets/button/custom_reactive_button.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/sign_out.dart';
import 'package:last_watched_tracker/features/home/presentation/cubit/user_info_cubit.dart';
import 'package:last_watched_tracker/features/home/presentation/cubit/user_info_state.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';
import 'package:last_watched_tracker/utils/helpers/strings/string_helper.dart';

import '../../../../common/widgets/icon/custom_icon_item.dart';
import '../../../../utils/theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              if (state is UserInfoLoading) {
                return AppCommons.centerProgressIndicator;
              }
              if (state is UserInfoLoadSuccess) {
                return Text.rich(
                  softWrap: true,
                  style: TextStyle(fontSize: 15),
                  TextSpan(
                    text: 'Welcome ',
                    children: [
                      TextSpan(
                        text: StringHelper.capitalizeAString(
                          state.userEntity.username,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.infoColor,
                        ),
                      ),
                      TextSpan(text: '!'),
                    ], //
                  ),
                );
              }
              if (state is UserInfoLoadFailed) {
                AppCommons.showScaffold(context, message: state.errMsg);
              }
              return const SizedBox.shrink();
            },
          ),
          const Menu(),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconItem(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.primaryColor,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 160,
              child: Center(
                child: Column(
                  children: [
                    BlocProvider(
                      create: (context) => ButtonStateCubit(),
                      child: Builder(
                        builder: (context) {
                          return CustomReactiveButton(
                            onPressed: () {
                              context.read<ButtonStateCubit>().execute(
                                usecase: SignOutUseCase(),
                              );
                              context.pushReplacement(login);
                            },
                            text: 'Sign Out',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
