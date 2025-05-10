import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../../core/widgets/custom_arrow_back_widget.dart';
import '../../../data/model/profile_item_model.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileItemModel});
  final ProfileItemModel profileItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: profileItemModel.onTap,
      splashColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            color: Color(0xffF5F5FF), borderRadius: BorderRadius.circular(8)),
        child: Center(
          child:
              CustomSvg(svgModel: SvgModel(image: profileItemModel.leading!)),
        ),
      ),
      title: Text(profileItemModel.title, style: Styles.medium14),
      trailing: CustomArrowBackWidget(),
    );
  }
}
