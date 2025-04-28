import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/profile_item_model.dart';
import '../../manager/profile/profile_cubit.dart';
import 'profile_item.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key, required this.items});
  final List<ProfileItemModel> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: items.map((e) => ProfileItem(profileItemModel: e)).toList(),
        );
      },
    );
  }
}
