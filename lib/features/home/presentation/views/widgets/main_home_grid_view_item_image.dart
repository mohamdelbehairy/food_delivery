import 'package:flutter/material.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/widgets/custom_cached_image.dart';

class MainHomeGridViewItemImage extends StatelessWidget {
  const MainHomeGridViewItemImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: CustomCachedImage(
                cachedImage: CachedImageModel(
                    imageUrl: imageUrl,
                    height: 125,
                    borderRadius: 8,
                    fit: BoxFit.cover))),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border, size: 20, color: Colors.red)),
        ),
      ],
    );
  }
}
