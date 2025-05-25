import 'package:flutter/material.dart';

import 'widgets/main_home_view_body.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9).withValues(alpha: .8),
      body: MainHomeViewBody(),
    );
  }
}
