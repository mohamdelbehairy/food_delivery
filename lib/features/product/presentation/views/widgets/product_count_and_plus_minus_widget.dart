import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/product/product_bloc.dart';
import 'product_plus_minus_item.dart';

class ProductCountAndPlusMinusWidget extends StatelessWidget {
  const ProductCountAndPlusMinusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductBloc>();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Row(
          children: [
            ProductPlusMinusItem(onTap: () => product.add(ProductMinusEvent())),
            const SizedBox(width: 11),
            Text(product.productCount.toString(),
                style: Styles.bold16.copyWith(color: AppColors.blackColor)),
            const SizedBox(width: 11),
            ProductPlusMinusItem(
                icon: Icons.add, onTap: () => product.add(ProductPlusEvent())),
          ],
        );
      },
    );
  }
}
