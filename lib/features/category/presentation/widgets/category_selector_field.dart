import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_commons.dart';
import '../../../../common/widgets/button/clickable_item.dart';
import '../../../../common/widgets/dialog/custom_dialog_bottom_sheet.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../cubit/category_selector_cubit.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';

class CategorySelectorField extends StatelessWidget {
  const CategorySelectorField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialogBottomSheet(
      text: context.watch<CategorySelectorCubit>().state,
      type: 'Category',
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: BlocProvider.of<CategoryCubit>(context)..fetchCategories(),
          ),
          BlocProvider.value(
            value: BlocProvider.of<CategorySelectorCubit>(context),
          ),
        ],
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (builderContext, state) {
            if (state is CategoriesLoading) {
              return AppCommons.labeledProgressIndicator(
                label: 'Categories Loading...',
              );
            } else if (state is CategoriesLoaded) {
              final categories = state.categories;
              return ListView.separated(
                separatorBuilder:
                    (listBuilderSeparatorContext, index) =>
                        AppConstants.getHorizontalDivider(
                          isFull: true,
                          isTransparent: false,
                          color: AppColors.primaryColor,
                        ),
                itemCount: categories.length,
                itemBuilder: (listBuilderContext, index) {
                  return ClickableItem(
                    text: categories[index].name,
                    onPressed: () {
                      context.read<CategorySelectorCubit>().setCategory(
                        categories[index].name,
                      );
                      context.pop();
                    },
                    icon: Icons.arrow_forward_ios_outlined,
                    color: AppColors.primaryColor,
                    iconSize: 12,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
