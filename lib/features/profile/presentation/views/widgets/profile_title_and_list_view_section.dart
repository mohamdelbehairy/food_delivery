import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/profile_item_model.dart';
import 'profile_list_view.dart';

class PofileTitleAndListViewSection extends StatelessWidget {
  const PofileTitleAndListViewSection(
      {super.key, required this.title, required this.items});
  final String title;
  final List<ProfileItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.medium12.copyWith(color: Color(0xff878787))),
        const SizedBox(height: 2),
        ProfileListView(items: items),
      ],
    );
  }
}