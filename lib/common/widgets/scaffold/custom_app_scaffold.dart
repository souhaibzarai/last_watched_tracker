import 'package:flutter/material.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: child));
  }
}
