import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/assets.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        index == 0
            ? Assets.imagesBoarding1
            : index == 1
                ? Assets.imagesBoarding2
                : Assets.imagesBoarding3,
        fit: BoxFit.cover,
        height: double.infinity);
  }
}
