import 'package:flutter/material.dart';

import '../../../data/model/help_center_model.dart';
import 'list_view_item.dart';

class GeneralListView extends StatelessWidget {
  const GeneralListView({super.key, required this.list});
  final List<HelpCenterModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: const Color(0xffF9F9F9).withValues(alpha: .4),
          child: Column(
            spacing: 20,
            children:
                list.map((e) => ListViewItem(helpCenterModel: e)).toList(),
          ),
        ),
      ],
    );
  }
}
