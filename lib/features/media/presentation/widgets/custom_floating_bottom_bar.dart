import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../common/widgets/button/custom_media_details_button.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';
import 'archive_media_button.dart' show ArchiveMediaButton;

class CustomFloatingBottomBar extends StatelessWidget {
  const CustomFloatingBottomBar({
    super.key,
    required this.media,
  });

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        border: Border.all(color: AppColors.textColor, width: 1.4),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        child: ClipPath(
          clipBehavior: Clip.hardEdge,
          clipper: MyCustomClipper(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArchiveMediaButton(media: media), //
                  CustomMediaDetailsButton(
                    icon: Icons.menu,
                    onPressed: () {},
                    color: AppColors.textColor,
                    size: 34,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();

    path.moveTo(30, size.height - 30);
    path.lineTo(10, 0);
    path.lineTo(size.width, 10);
    path.lineTo(40, size.width);
    path.lineTo(180, size.height);
    path.lineTo(0, size.width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
