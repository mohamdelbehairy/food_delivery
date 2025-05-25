import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/model/category_item_model.dart';

class MainHomeCategoryItem extends StatelessWidget {
  const MainHomeCategoryItem(
      {super.key,
      required this.categoryItemModel,
      required this.isSeclected,
      required this.onTap});
  final CategoryItemModel categoryItemModel;
  final bool isSeclected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 65,
        width: 60,
        decoration: BoxDecoration(
            color: isSeclected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryItemModel.image, height: 24, width: 24),
            const SizedBox(height: 2),
            Text(categoryItemModel.title,
                style: Styles.medium14.copyWith(
                    color: isSeclected ? Colors.white : AppColors.blackColor))
          ],
        ),
      ),
    );
  }
}
