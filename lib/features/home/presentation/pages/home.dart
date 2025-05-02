import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/scaffold/custom_app_scaffold.dart';
import '../../../../utils/constants/constants.dart';
import '../cubit/user_info_cubit.dart';
import '../widgets/archived.dart';
import '../widgets/header.dart';
import '../widgets/medias.dart';

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
              const Header(),
              AppConstants.verticalMediumSizedBox,
              const Archived(),
              Expanded(child: const Medias()),
            ],
          ),
        ),
      ),
    );
  }
}
