import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import '../../../../utils/theme/app_colors.dart';
import '../../domain/entities/media.dart';

class MediaNotes extends StatelessWidget {
  const MediaNotes({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.getNotesDivider(endIndent: 50),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              style: const TextStyle(color: AppColors.textColor, fontSize: 14),
              children: [
                const TextSpan(
                  text: '➾ ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor,
                  ),
                ),
                TextSpan(text: media.notes!),
              ],
            ),
          ),
        ),
        AppConstants.getNotesDivider(indent: 50),
      ],
    );
  }
}
