import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/common/widgets/scaffold/custom_app_scaffold.dart';
import 'package:last_watched_tracker/features/home/presentation/widgets/custom_search_field.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';

import '../cubit/user_info_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserInfoCubit()..getUserInfo()),
      ],
      child: CustomAppScaffold(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const CustomSearchField(),
              AppConstants.mediumSizedBox,
              AppConstants.getHorizontalDivider(isTransparent: false),
              AppConstants.mediumSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
