import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/custom_svg.dart';
import '../../../../../core/utils/styles.dart';
import 'delivery_and_time_and_rate_and_description_text.dart';

class ProductDliveryAndTimeAndRate extends StatelessWidget {
  const ProductDliveryAndTimeAndRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: .04),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text("\$", style: Styles.extraBold15),
              SizedBox(width: 8),
              DleiveryAndTimeAndRateDescriptionText(text: "Free Delivery"),
            ],
          ),
          Row(
            children: [
              CustomSvg(svgModel: SvgModel(image: Assets.imagesSubtract)),
              const SizedBox(width: 8),
              const DleiveryAndTimeAndRateDescriptionText(text: "20 - 30"),
            ],
          ),
          const Row(
            children: [
              Icon(Icons.star, color: AppColors.primaryColor, size: 16),
              SizedBox(width: 8),
              DleiveryAndTimeAndRateDescriptionText(text: "4.5"),
            ],
          ),
        ],
      ),
    );
  }
}
