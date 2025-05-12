import 'package:flutter/material.dart';

import 'widgets/custom_profile_app_bar.dart';
import 'widgets/help_center_view_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customProfileAppBar(context, title: "Help Center"),
      body: const HelpCenterViewBody(),
    );
  }
}
