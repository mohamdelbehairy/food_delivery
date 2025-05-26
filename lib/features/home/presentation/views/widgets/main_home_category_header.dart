import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../product/presentation/views/all_products_view.dart';

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
          GestureDetector(
            onTap: () => Navigation.push(context, const AllProductsView()),
            child: Text("See All",
                style: Styles.medium14.copyWith(color: AppColors.primaryColor)),
          )
        ],
      ),
    );
  }
}
