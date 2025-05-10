import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/profile/data/model/profile_item_model.dart';

import '../../manager/setting/setting_bloc.dart';
import 'setting_item.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({super.key, required this.list});
  final List<ProfileItemModel> list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Column(
          children: list.map((e) => SettingItem(profileItemModel: e)).toList(),
        );
      },
    );
  }
}
