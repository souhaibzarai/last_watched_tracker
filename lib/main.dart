import 'package:flutter/material.dart';

void main() {
  runApp(const LastWatchedTracker());
}

class LastWatchedTracker extends StatelessWidget {
  const LastWatchedTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Last Watched Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
