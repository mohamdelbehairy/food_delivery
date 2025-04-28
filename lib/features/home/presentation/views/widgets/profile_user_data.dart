import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/styles.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text("Profile Settings", style: Styles.semiBold16),
        const SizedBox(height: 40),
        CircleAvatar(radius: 50, child: Image.asset(Assets.imagesRectangle)),
        const SizedBox(height: 20),
        Text("Albert Stevano Bajefski", style: Styles.semiBold16),
        const SizedBox(height: 4),
        Text("Albertstevano@gmail.com",
            style: Styles.reqular14.copyWith(color: const Color(0xff878787))),
      ],
    );
  }
}
