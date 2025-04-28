import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';

import '../../../data/model/provider_item_model.dart';

class AuthProviderItem extends StatelessWidget {
  const AuthProviderItem({super.key, required this.providerItemModel});
  final ProviderItemModel providerItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: providerItemModel.onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xffD6D6D6))),
        child: Center(
            child: CustomSvg(
                svgModel: SvgModel(
                    image: providerItemModel.image,
                    height: providerItemModel.height,
                    width: providerItemModel.width))),
      ),
    );
  }
}
