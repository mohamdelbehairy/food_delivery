import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/app_bar_model.dart';

import '../../data/model/product_data_model.dart';
import 'widgets/product_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productData});
  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(AppBarModel(
          title: "About This Menu",
          context: context,
          backgroundColor: Colors.white)),
      body: const ProductViewBody(),
    );
  }
}
