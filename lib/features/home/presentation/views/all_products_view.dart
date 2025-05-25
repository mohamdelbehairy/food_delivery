import 'package:flutter/material.dart';

import 'widgets/all_products_app_bar.dart';
import 'widgets/main_home_view_grid_view.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: allProductsAppBar(context),
      body: const SafeArea(child: MainHomeViewGridView(isAllProducts: true)),
    );
  }
}
