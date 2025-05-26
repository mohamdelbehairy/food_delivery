import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/app_bar_model.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            AppBarModel(title: "Profile Settings", isLeading: false)),
        body: const ProfileViewBody());
  }
}
