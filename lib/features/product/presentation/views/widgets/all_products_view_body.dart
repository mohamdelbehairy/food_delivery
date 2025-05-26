import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/main_home_view_grid_view.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHomeViewGridView(isAllProducts: true),
      ],
    );
  }
}
