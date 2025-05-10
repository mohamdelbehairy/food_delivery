import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../../core/widgets/custom_arrow_back_widget.dart';

class SettingLanguageTrailing extends StatelessWidget {
  const SettingLanguageTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("English", style: Styles.medium14),
          const SizedBox(width: 16),
          const CustomArrowBackWidget()
        ],
      ),
    );
  }
}
