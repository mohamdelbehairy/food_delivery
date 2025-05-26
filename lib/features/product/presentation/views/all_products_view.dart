import 'package:flutter/material.dart';

import '../../../../core/model/app_bar_model.dart';
import 'widgets/all_products_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: customAppBar(AppBarModel(
          title: "All Products",
          context: context,
          backgroundColor: const Color(0xFFFAFAFA))),
      body: const SafeArea(child: AllProductsViewBody()),
    );
  }
}
