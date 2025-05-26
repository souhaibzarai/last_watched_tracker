import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset({
    super.key,
    required this.path,
    this.color,
    this.height = 32,
  });

  final String path;
  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, color: color, height: height.h);
  }
}
