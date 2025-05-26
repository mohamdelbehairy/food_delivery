import 'package:flutter/material.dart';

import 'product_button.dart';
import 'product_count_and_button_background.dart';
import 'product_count_and_plus_minus_widget.dart';

class ProductCountAndButtonSection extends StatelessWidget {
  const ProductCountAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductCountAndButtonBackground(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductCountAndPlusMinusWidget(),
          ProductButton(),
        ],
      ),
    );
  }
}
