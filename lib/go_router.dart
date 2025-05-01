import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last_watched_tracker/features/auth/presentation/pages/reset_password.dart';
import 'package:last_watched_tracker/features/auth/presentation/pages/reset_sent.dart';
import 'package:last_watched_tracker/features/auth/presentation/pages/sign_in.dart';
import 'package:last_watched_tracker/features/auth/presentation/pages/sign_up.dart';
import 'package:last_watched_tracker/features/home/presentation/pages/home.dart';
import 'package:last_watched_tracker/features/media/presentation/pages/add_media.dart';
import 'package:last_watched_tracker/features/splash/presentation/splash.dart';
import 'package:last_watched_tracker/utils/helpers/navigator/strings.dart';

import 'features/auth/presentation/cubit/check_cubit.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NavigatorPath.splash,
      builder: (context, state) => const SplashPage(),
      routes: [
        GoRoute(
          path: NavigatorPath.login,
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: NavigatorPath.signUp,
          builder:
              (context, state) => BlocProvider(
                create: (context) => CheckCubit(),
                child: const SignUpPage(),
              ),
        ),
        GoRoute(
          path: NavigatorPath.resetPsw,
          builder: (context, state) => const ResetPasswordPage(),
        ),
        GoRoute(
          path: NavigatorPath.resetSent,
          builder: (context, state) => const ResetSentPage(),
        ),
        GoRoute(
          path: NavigatorPath.home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: NavigatorPath.addMedia,
          builder: (context, state) => const AddMediaPage(),
        ),
      ],
    ),
  ],
);
