import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../manager/setting/setting_bloc.dart';
import 'setting_list_view.dart';

class SettingHeaderAndListViewSection extends StatelessWidget {
  const SettingHeaderAndListViewSection({super.key, this.isProfile = true});
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    final setting = context.watch<SettingBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isProfile ? "PROFILE" : "OTHER",
            style: Styles.medium12.copyWith(color: const Color(0xff878787))),
        SettingListView(
            list: isProfile
                ? setting.profileItems(context)
                : setting.otherItems(context)),
      ],
    );
  }
}
