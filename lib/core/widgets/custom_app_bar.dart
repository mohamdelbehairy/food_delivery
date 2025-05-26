import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../model/app_bar_model.dart';
import '../model/svg_model.dart';
import '../utils/assets.dart';
import '../utils/custom_svg.dart';
import '../utils/navigation.dart';

AppBar customAppBar(AppBarModel appBar) {
  return AppBar(
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    title: Text(appBar.title, style: Styles.semiBold16),
    backgroundColor: appBar.backgroundColor ?? Colors.white,
    leading: appBar.isLeading
        ? Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomSvg(
                    svgModel: SvgModel(
                        onTap: () => Navigation.pop(appBar.context!),
                        image: Assets.imagesArrowBack))))
        : null,
    actions: appBar.actions,
  );
}
