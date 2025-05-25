import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthScaffold extends StatelessWidget {
  const CustomAuthScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavBar,
    this.drawer,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10).r,
          child: body,
        ),
      ),
      drawer: drawer,
      appBar: appBar,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
