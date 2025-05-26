import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import '../../../data/model/product_data_model.dart';
import 'product_count_and_button_section.dart';
import 'product_view_components.dart';
import 'product_view_header.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.productData});
  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomScrollViewWidget(
            horizontal: 0,
            child: Column(
              children: [
                const SizedBox(height: 16),
                ProductViewHeader(productData: productData),
                const SizedBox(height: 16),
                ProductViewComponents(productData: productData),
              ],
            )),
        const ProductCountAndButtonSection(),
      ],
    );
  }
}
