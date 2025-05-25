import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/background_item_model.dart';
import '../../../data/model/help_center_model.dart';
import 'help_center_item_background.dart';

class DisplayHelpItem extends StatelessWidget {
  const DisplayHelpItem({super.key, required this.helpCenterModel});
  final HelpCenterModel helpCenterModel;

  @override
  Widget build(BuildContext context) {
    return HelpCenterItemBackground(
      backgroundItemModel: BackgroundItemModel(
          height: null,
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(helpCenterModel.title, style: Styles.semiBold16),
            subtitle: Text(helpCenterModel.subTitle,
                style:
                    Styles.regular14.copyWith(color: const Color(0xff878787))),
          )),
    );
  }
}
