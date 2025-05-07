import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import 'gender_bottom_sheet_button.dart';
import 'gender_bottom_sheet_divider.dart';
import 'gender_bottom_sheet_list_view.dart';

class GenderBottomSheet extends StatelessWidget {
  const GenderBottomSheet({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          GenderBottomSheetDivider(),
          const SizedBox(height: 16),
          Text("Select Gender", style: Styles.semiBold16),
          const SizedBox(height: 28),
          const GenderBottomSheetListView(),
          const SizedBox(height: 32),
          GenderBottomSheetButton(onTap: onTap),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
