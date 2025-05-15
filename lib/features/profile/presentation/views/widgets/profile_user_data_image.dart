import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../../../core/model/cached_network_model.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import 'profile_user_image.dart';

class ProfileUserDataImage extends StatelessWidget {
  const ProfileUserDataImage({super.key, this.userImage});
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return ProfileUserImage(
        child: userImage != null && userImage!.isNotEmpty
            ? CustomCachedNetworkImage(
                cachedNetworkModel: CachedNetworkModel(imageUrl: userImage!))
            : Image.asset(Assets.imagesDefaultProfile, fit: BoxFit.fill));
  }
}
