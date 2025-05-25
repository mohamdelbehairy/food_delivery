import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class MainHomeHeaderText extends StatelessWidget {
  const MainHomeHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24,
      bottom: 24,
      child: Text("Manage the best\nfood for your users",
          style: Styles.semiBold32),
    );
  }
}