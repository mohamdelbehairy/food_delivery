import 'package:flutter/material.dart';

class CachedImageModel {
  final String imageUrl;
  final double? height, width, borderRadius;
  final BoxFit? fit;

  CachedImageModel(
      {required this.imageUrl,
      this.height,
      this.width,
      this.borderRadius,
      this.fit});
}