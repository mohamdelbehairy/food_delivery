import 'package:flutter/material.dart';

import '../../../data/model/profile_item_model.dart';
import 'setting_item.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({super.key, required this.list});
  final List<ProfileItemModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: list.map((e) => SettingItem(profileItemModel: e)).toList(),
    );
  }
}
