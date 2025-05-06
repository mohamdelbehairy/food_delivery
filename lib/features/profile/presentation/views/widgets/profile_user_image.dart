import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/colors.dart';

class ProfileUserImage extends StatelessWidget {
  const ProfileUserImage({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(width: .3, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:
              child ?? Image.asset(Assets.imagesRectangle, fit: BoxFit.fill)),
    );
  }
}
