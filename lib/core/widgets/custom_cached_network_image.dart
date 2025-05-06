import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/cached_network_model.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.cachedNetworkModel});
  final CachedNetworkModel cachedNetworkModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: cachedNetworkModel.imageUrl,
        fit: cachedNetworkModel.fit ?? BoxFit.cover,
        placeholder: cachedNetworkModel.placeholder);
  }
}
