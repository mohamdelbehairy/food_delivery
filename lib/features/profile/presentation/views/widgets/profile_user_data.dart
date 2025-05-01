import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import 'profile_image_widget.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImageWidget(),
        const SizedBox(height: 20),
        Text("Albert Stevano Bajefski", style: Styles.semiBold16),
        const SizedBox(height: 4),
        Text("Albertstevano@gmail.com",
            style: Styles.reqular14.copyWith(color: const Color(0xff878787))),
      ],
    );
  }
}
