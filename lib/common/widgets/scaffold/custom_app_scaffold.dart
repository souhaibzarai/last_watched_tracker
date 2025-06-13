import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
        minimum: EdgeInsets.only(top: 35).r,
      ),
    );
  }
}
