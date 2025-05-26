import 'package:flutter/material.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonModel: ButtonModel(
      width: 183,
      backgroundColor: AppColors.primaryColor,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          SizedBox(width: 8),
          Text("Add to Cart", style: Styles.semiBold14)
        ],
      ),
    ));
  }
}