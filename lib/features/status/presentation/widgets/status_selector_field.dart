import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/widgets/button/clickable_item.dart';
import '../../../../common/widgets/dialog/custom_dialog_bottom_sheet.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../cubit/status_cubit.dart';
import '../cubit/status_selector_cubit.dart';
import '../cubit/status_state.dart';

class StatusSelectorField extends StatelessWidget {
  const StatusSelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogBottomSheet(
      text: context.watch<StatusSelectorCubit>().state,
      type: 'Status',
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: BlocProvider.of<StatusCubit>(context)..fetchStatus(),
          ),
          BlocProvider.value(
            value: BlocProvider.of<StatusSelectorCubit>(context),
          ),
        ],
        child: BlocBuilder<StatusCubit, StatusState>(
          builder: (builderContext, state) {
            if (state is StatusLoading) {
              return AppCommons.labeledProgressIndicator(
                label: 'Status Loading...',
              );
            } else if (state is StatusLoaded) {
              final status = state.status;
              return ListView.separated(
                separatorBuilder:
                    (listBuilderSeparatorContext, index) =>
                        AppConstants.getHorizontalDivider(
                          isFull: true,
                          isTransparent: false,
                          color: AppColors.previewTextBgColor,
                        ),
                itemCount: status.length,
                itemBuilder: (listBuilderContext, index) {
                  return ClickableItem(
                    text: status[index].name,
                    onPressed: () {
                      context.read<StatusSelectorCubit>().setStatus(
                        status[index].name,
                      );
                      context.pop();
                    },
                    icon: Icons.arrow_forward_ios_outlined,
                    iconSize: 12.sp,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ).r,
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
