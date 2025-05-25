import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/cached_image_model.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.cachedImage});
  final CachedImageModel cachedImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(cachedImage.borderRadius ?? 0),
        child: CachedNetworkImage(
            imageUrl: cachedImage.imageUrl,
            height: cachedImage.height,
            width: cachedImage.width,
            fit: cachedImage.fit));
  }
}
