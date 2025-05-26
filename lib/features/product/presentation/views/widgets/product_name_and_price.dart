import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/model/product_data_model.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({super.key, required this.productData});

  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(productData.productName, style: Styles.semiBold24),
        const SizedBox(height: 8),
        Text("EGP ${productData.productPrice}", style: Styles.bold18),
      ],
    );
  }
}