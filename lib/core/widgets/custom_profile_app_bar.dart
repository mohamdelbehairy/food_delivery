import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import 'custom_app_bar.dart';

AppBar customProfileAppBar(BuildContext context, {String? title}) {
  return customAppBar(
      title: title ?? "Personal Date",
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
