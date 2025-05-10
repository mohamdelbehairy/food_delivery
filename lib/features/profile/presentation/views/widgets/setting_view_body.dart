import 'package:flutter/material.dart';

import 'setting_header_and_list_view_section.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const SettingHeaderAndListViewSection(),
          const SizedBox(height: 16),
          SettingHeaderAndListViewSection(isProfile: false),
        ],
      ),
    );
  }
}
