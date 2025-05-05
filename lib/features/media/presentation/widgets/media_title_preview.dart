import 'package:flutter/material.dart';

import '../../../../common/widgets/text/custom_text.dart';
import '../../domain/entities/media.dart';

class MediaPreviewTitle extends StatelessWidget {
  const MediaPreviewTitle({super.key, required this.media});

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomText(media.title, size: 16, fw: FontWeight.bold);
  }
}
