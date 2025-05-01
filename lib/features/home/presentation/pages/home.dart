import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_watched_tracker/common/widgets/scaffold/custom_app_scaffold.dart';
import 'package:last_watched_tracker/features/home/presentation/widgets/header.dart';
import 'package:last_watched_tracker/features/media/presentation/cubit/fetch_medias_cubit.dart';
import 'package:last_watched_tracker/utils/constants/constants.dart';

import '../cubit/user_info_cubit.dart';
import '../widgets/medias.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserInfoCubit()..getUserInfo()),
        BlocProvider(create: (context) => FetchMediasCubit()..fetchMedias()),
      ],
      child: CustomAppScaffold(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Header(),
              AppConstants.verticalMediumSizedBox,
              const Medias(),
            ],
          ),
        ),
      ),
    );
  }
}
