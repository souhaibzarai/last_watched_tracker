import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:last_watched_tracker/firebase_options.dart';
import 'package:last_watched_tracker/go_router.dart';
import 'package:last_watched_tracker/utils/theme/app_theme.dart';

import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();

  runApp(const LastWatchedTracker());
}

class LastWatchedTracker extends StatelessWidget {
  const LastWatchedTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Last Watched Tracker',
      theme: AppTheme.theme, //
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
