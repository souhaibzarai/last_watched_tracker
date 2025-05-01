import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';

import '../../../../utils/constants/images_path.dart';
import 'cubit/splash_cubit.dart';
import 'cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..appStarted(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (current, prev) => current != prev,
        listener: (context, state) {
          if (state is UnAuthenticated) {
            context.pushReplacement(NavigatorPath.login);
          }
          if (state is Authenticated) {
            context.pushReplacement(NavigatorPath.home);
          }
        },
        child: Scaffold(
          body: Center(
            child: Image.asset(
              ImagesPath.splashImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
