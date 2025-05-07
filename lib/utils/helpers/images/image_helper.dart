import 'package:flutter/widgets.dart';

import '../../constants/images_path.dart';

class ImageHelper {
  ImageHelper._();

  static Widget getImage({required String imgUrl}) {
    if (imgUrl == 'null' || imgUrl.isEmpty) {
      return Image.asset(ImagesPath.splashImage, fit: BoxFit.cover);
    } else {
      return Image.network(imgUrl, width: double.infinity, fit: BoxFit.cover);
    }
  }
}
