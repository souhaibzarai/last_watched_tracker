import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/media/presentation/cubit/archive_media_cubit.dart';
import 'features/media/presentation/cubit/fetch_medias_cubit.dart';
import 'firebase_options.dart';
import 'go_router.dart';
import 'service_locator.dart';
import 'utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 752),

      child: const LastWatchedTracker(),
    ),
  );
}

class LastWatchedTracker extends StatelessWidget {
  const LastWatchedTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchMediasCubit()..fetchMedias()),
        BlocProvider(
          create: (context) => ArchiveMediaCubit(
            fetchMediasCubit: context.read<FetchMediasCubit>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Last Watched Tracker',
        theme: AppTheme.theme, //
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
