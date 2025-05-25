import 'package:flutter/material.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_svg.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../../core/widgets/custom_app_bar.dart';

AppBar allProductsAppBar(BuildContext context) {
  return customAppBar(
      title: "All Products",
     backgroundColor: const Color(0xFFFAFAFA),
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CustomSvg(
              svgModel: SvgModel(
                  onTap: () => Navigation.pop(context),
                  image: Assets.imagesArrowBack)),
        ),
      ));
}
