import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/presentation/cubit/check_cubit.dart';
import 'features/auth/presentation/pages/reset_password.dart';
import 'features/auth/presentation/pages/reset_sent.dart';
import 'features/auth/presentation/pages/sign_in.dart';
import 'features/auth/presentation/pages/sign_up.dart';
import 'features/category/presentation/cubit/category_cubit.dart';
import 'features/category/presentation/cubit/category_selector_cubit.dart';
import 'features/home/presentation/pages/home.dart';
import 'features/media/presentation/pages/add_media.dart';
import 'features/media/presentation/pages/archive.dart';
import 'features/splash/presentation/splash.dart';
import 'features/status/presentation/cubit/status_cubit.dart';
import 'features/status/presentation/cubit/status_selector_cubit.dart';
import 'utils/helpers/navigator/strings.dart';

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
                create: (_) => CheckCubit(),
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
          builder:
              (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => CategorySelectorCubit(),
                    lazy: true,
                  ),
                  BlocProvider(
                    create: (_) => StatusSelectorCubit(),
                    lazy: true,
                  ),
                  BlocProvider(create: (_) => CategoryCubit(), lazy: true),
                  BlocProvider(create: (_) => StatusCubit(), lazy: true),
                ],
                child: const AddMediaPage(),
              ),
        ),
        GoRoute(
          path: NavigatorPath.archive,
          builder: (context, state) => const ArchivePage(),
        ),
      ],
    ),
  ],
);
