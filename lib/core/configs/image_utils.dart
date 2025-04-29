import 'package:flutter_svg/flutter_svg.dart';

import 'assets/app_vectors.dart';

class ImageUtils {
  static void svgPrecacheImage() {
    const cacheSvgImages = [
      /// Specify the all the svg image to cache
      AppVectors.mastercard,
      AppVectors.rectangle1,
      AppVectors.rectangle2,
      AppVectors.eyeOff,
      AppVectors.eye,
      AppVectors.copy,
      AppVectors.copyDetails,
      AppVectors.calendar,
      AppVectors.plus,
      AppVectors.details,
      AppVectors.more,
      AppVectors.menu,
      AppVectors.notification,
      AppVectors.freeze,
      AppVectors.close,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }
}
