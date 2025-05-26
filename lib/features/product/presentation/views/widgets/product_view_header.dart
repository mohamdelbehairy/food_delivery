import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../data/model/product_data_model.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productData});

  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: productData.productImages.length == 1
          ? Center(
              child: CustomCachedImage(
                  cachedImage: CachedImageModel(
                      imageUrl: productData.productImages[0],
                      height: 343,
                      fit: BoxFit.cover,
                      borderRadius: 16)))
          : ImageSlideshow(
              height: 343,
              width: double.infinity,
              initialPage: 0,
              isLoop: true,
              autoPlayInterval: 3000,
              indicatorRadius: 4,
              indicatorColor: AppColors.primaryColor,
              indicatorBackgroundColor: Colors.white,
              children: productData.productImages
                  .map((e) => CustomCachedImage(
                      cachedImage: CachedImageModel(
                          imageUrl: e, fit: BoxFit.cover, borderRadius: 16)))
                  .toList(),
            ),
    );
  }
}
