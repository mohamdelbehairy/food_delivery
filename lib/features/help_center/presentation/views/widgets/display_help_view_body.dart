import 'package:flutter/material.dart';

import '../../../data/model/help_center_model.dart';
import 'display_help_list_view.dart';

class DisplayHelpViewBody extends StatelessWidget {
  const DisplayHelpViewBody({super.key, required this.list});
  final List<HelpCenterModel> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: DisplayHelpListView(list: list),
    );
  }
}
