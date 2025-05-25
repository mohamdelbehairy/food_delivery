import 'package:flutter/material.dart';

import 'main_home_view_category_section.dart';
import 'main_home_view_grid_view.dart';
import 'main_home_view_header.dart';

class MainHomeViewBody extends StatelessWidget {
  const MainHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        MainHomeViewHeader(),
        MainHomeViewCategorySection(),
        MainHomeViewGridView()
      ],
    );
  }
}
