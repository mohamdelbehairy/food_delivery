import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

AppBar personalDataAppBar(BuildContext context) {
  return customAppBar(
      title: "Personal Date",
      leading: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: CustomSvg(
              svgModel: SvgModel(
                  onTap: () => Navigation.pop(context),
                  image: Assets.imagesArrowBack)),
        ),
      ));
}
