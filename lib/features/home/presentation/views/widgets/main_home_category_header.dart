import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../../../../core/utils/styles.dart';

class MainHomeCategoryHeader extends StatelessWidget {
  const MainHomeCategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Find by Category", style: Styles.semiBold16),
          Text("See All",
              style: Styles.medium14.copyWith(color: AppColors.primaryColor))
        ],
      ),
    );
  }
}
