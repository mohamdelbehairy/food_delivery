import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class ProductPlusMinusItem extends StatelessWidget {
  const ProductPlusMinusItem({super.key, this.icon, required this.onTap});
  final IconData? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xffEAEAEA))),
        child: Icon(icon ?? Icons.remove, color: AppColors.blackColor),
      ),
    );
  }
}
