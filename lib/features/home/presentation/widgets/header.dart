import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/features/auth/domain/usecases/sign_out.dart';

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
          IconButton(
            onPressed: () async {
              await SignOutUseCase().call();
              if (context.mounted) {
                context.go(NavigatorPath.login);
              }
            },
            icon: Icon(Icons.logout, color: AppColors.secondaryColor),
          ),
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
