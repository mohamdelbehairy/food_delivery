import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'main_home_header_location.dart';
import 'main_home_header_search_and_notification.dart';
import 'main_home_header_text.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Assets.imagesHomeHeader),
            const MainHomeHeaderLocation(),
            const MainHomeHeaderSearchAndNotificaton(),
            const MainHomeHeaderText(),
          ],
        ),
      ],
    );
  }
}
