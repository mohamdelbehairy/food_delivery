import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import 'help_center_header_and_search_section.dart';
import 'help_center_list_view.dart';

class HelpCenterViewBody extends StatelessWidget {
  const HelpCenterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollViewWidget(
      child: Column(
        children: [
          HelpCenterHeaderAndSearhSection(),
          SizedBox(height: 24),
          HelpCenterListView(),
        ],
      ),
    );
  }
}
