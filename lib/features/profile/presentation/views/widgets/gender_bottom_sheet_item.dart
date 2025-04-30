import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/gender_item_model.dart';

class GenderBottomSheetItem extends StatelessWidget {
  const GenderBottomSheetItem(
      {super.key, required this.genderItemModel, required this.isActive});
  final GenderItemModel genderItemModel;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(
              color:
                  isActive ? const Color(0xffFF9C44) : const Color(0xffEAEAEA)),
          borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: Color(0xffF3F6FB),
          child: Icon(genderItemModel.icon,
              size: 18, color: const Color(0xff101010)),
        ),
        title: Text(genderItemModel.title,
            style: Styles.semiBold14.copyWith(color: Color(0xff101010))),
        trailing: isActive
            ? CustomSvg(svgModel: SvgModel(image: Assets.imagesDone))
            : null,
      ),
    );
  }
}
