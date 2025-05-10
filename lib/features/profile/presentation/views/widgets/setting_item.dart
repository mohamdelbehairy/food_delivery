import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/profile_item_model.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.profileItemModel});
  final ProfileItemModel profileItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(profileItemModel.title, style: Styles.medium14),
      trailing: profileItemModel.trailing ??
          Transform.scale(
            scale: .8,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Switch(
                value: profileItemModel.isSwitch ?? false,
                activeTrackColor: AppColors.primaryColor,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xffDFE0F3),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                onChanged: (value) {},
              ),
            ),
          ),
    );
  }
}
