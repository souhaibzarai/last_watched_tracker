import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/helpers/navigator/strings.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../../media/presentation/cubit/fetch_medias_cubit.dart';
import 'custom_search_field.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: const CustomSearchField(), //
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () async {
              final isItemAdded = await context.push(NavigatorPath.addMedia);
              if (isItemAdded == true && context.mounted) {
                context.read<FetchMediasCubit>().fetchMedias(
                  showLoading: false,
                );
              }
            },
            icon: Icon(CupertinoIcons.add),
            color: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}
