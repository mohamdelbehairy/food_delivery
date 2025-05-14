import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_profile_app_bar.dart';
import '../../data/model/help_center_model.dart';
import 'widgets/display_help_view_body.dart';

class DisplayHelpView extends StatelessWidget {
  const DisplayHelpView({super.key, required this.title, required this.list});
  final String title;
  final List<HelpCenterModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customProfileAppBar(context, title: title),
        body: DisplayHelpViewBody(list: list));
  }
}
