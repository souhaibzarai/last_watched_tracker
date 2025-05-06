import 'package:flutter/material.dart';

import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaNotes extends StatelessWidget {
  const MediaNotes({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        style: const TextStyle(color: AppColors.textColor, fontSize: 14),
        children: [
          const TextSpan(
            text: '➾ ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryColor,
            ),
          ),
          TextSpan(text: media.notes!),
        ],
      ),
    );
  }
}
