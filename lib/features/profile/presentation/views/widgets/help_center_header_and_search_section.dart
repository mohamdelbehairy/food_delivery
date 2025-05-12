import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'help_center_search_widget.dart';

class HelpCenterHeaderAndSearhSection extends StatelessWidget {
  const HelpCenterHeaderAndSearhSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 28),
        Text("Hi, how we can help you?", style: Styles.semiBold16),
        SizedBox(height: 20),
        HelpCenterSearchWidget(),
      ],
    );
  }
}