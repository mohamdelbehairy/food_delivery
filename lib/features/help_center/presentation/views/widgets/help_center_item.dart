import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:food_delivery/features/help_center/data/model/background_item_model.dart';

import '../../../data/model/help_center_model.dart';
import 'help_center_item_background.dart';

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({super.key, required this.helpCenterModel});
  final HelpCenterModel helpCenterModel;

  @override
  Widget build(BuildContext context) {
    return HelpCenterItemBackground(
      backgroundItemModel: BackgroundItemModel(
          height: 84,
          onTap: helpCenterModel.onTap,
          child: ListTile(
            leading:
                CustomSvg(svgModel: SvgModel(image: helpCenterModel.leading!)),
            title: Text(helpCenterModel.title, style: Styles.semiBold16),
            subtitle: Text(helpCenterModel.subTitle,
                style:
                    Styles.regular14.copyWith(color: const Color(0xff878787))),
          )),
    );
  }
}
