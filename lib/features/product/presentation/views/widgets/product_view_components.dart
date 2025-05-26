import 'package:flutter/material.dart';

import '../../../data/model/product_data_model.dart';
import 'product_delivery_and_time_and_rate.dart';
import 'product_description.dart';
import 'product_name_and_price.dart';

class ProductViewComponents extends StatelessWidget {
  const ProductViewComponents({super.key, required this.productData});

  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameAndPrice(productData: productData),
          const SizedBox(height: 16),
          const ProductDliveryAndTimeAndRate(),
          const SizedBox(height: 12),
          const Divider(color: Color(0xffEDEDED), thickness: 2),
          const SizedBox(height: 12),
          ProductDescription(description: productData.productDescription)
        ],
      ),
    );
  }
}
