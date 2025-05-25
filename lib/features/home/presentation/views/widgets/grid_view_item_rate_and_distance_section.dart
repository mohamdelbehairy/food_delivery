import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/custom_svg.dart';
import '../../../../../core/utils/styles.dart';

class GridViewItemRateAndDistanceSection extends StatelessWidget {
  const GridViewItemRateAndDistanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.star, size: 18, color: AppColors.primaryColor),
            const SizedBox(width: 6),
            Text("4.9",
                style: Styles.medium12.copyWith(color: AppColors.blackColor)),
          ],
        ),
        Row(
          children: [
            CustomSvg(
                svgModel: SvgModel(
                    image: Assets.imagesLocation,
                    color: AppColors.primaryColor,
                    height: 14)),
            const SizedBox(width: 6),
            Text("190m",
                style: Styles.medium12.copyWith(color: AppColors.blackColor)),
          ],
        ),
      ],
    );
  }
}
