import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../product/data/model/product_data_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../product/presentation/views/product_view.dart';
import 'grid_view_item_rate_and_distance_section.dart';
import 'main_home_grid_view_item_image.dart';

class MainHomeGridViewItem extends StatelessWidget {
  const MainHomeGridViewItem({super.key, required this.productData});
  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigation.push(context, ProductView(productData: productData)),
      child: Container(
        width: 153,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainHomeGridViewItemImage(imageUrl: productData.productImages[0]),
            const SizedBox(height: 12),
            Text(productData.productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.medium16),
            const SizedBox(height: 12),
            const GridViewItemRateAndDistanceSection(),
            const SizedBox(height: 12),
            Text("EGP ${productData.productPrice}", style: Styles.bold16),
          ],
        ),
      ),
    );
  }
}
