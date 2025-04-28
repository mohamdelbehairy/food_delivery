import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';

import '../../../../../core/model/svg_model.dart';
import '../../../data/model/bottom_nav_model.dart';

BottomNavigationBarItem bottomNavBarItem(
    BottomNavModel bottomNavModel, bool activeIndex) {
  return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 2),
        child: CustomSvg(
            svgModel: SvgModel(
                image: bottomNavModel.image,
                color: activeIndex
                    ? AppColors.primaryColor
                    : const Color(0xffC2C2C2))),
      ),
      label: activeIndex ? bottomNavModel.lable : '');
}
