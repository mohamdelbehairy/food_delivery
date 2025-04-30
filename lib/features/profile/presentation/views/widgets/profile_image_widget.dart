
import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/assets.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 50, child: Image.asset(Assets.imagesRectangle));
  }
}