import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home/home_bloc.dart';
import 'main_home_grid_view_item.dart';
import 'no_products_widget.dart';

class MainHomeViewGridView extends StatelessWidget {
  const MainHomeViewGridView({super.key, this.isAllProducts = false});
  final bool isAllProducts;

  @override
  Widget build(BuildContext context) {
    final products = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (products.productsList.isEmpty || products.allProductsList.isEmpty) {
          return const NoProductsWidget();
        }
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: isAllProducts ? 24 : 0),
            child: GridView.builder(
                itemCount: isAllProducts
                    ? products.allProductsList.length
                    : products.productsList.length,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.35,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) => MainHomeGridViewItem(
                  
                    productData: isAllProducts
                        ? products.allProductsList[index]
                        : products.productsList[index])),
          ),
        );
      },
    );
  }
}
