import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/widgets/custom_button.dart';

class HelpCenterSearchWidget extends StatelessWidget {
  const HelpCenterSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonModel: ButtonModel(
      borderRadius: 8,
      borderColor: const Color(0xffEDEDED),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, size: 24, color: const Color(0xff878787)),
          const SizedBox(width: 8),
          Text("Search",
              style: Styles.semiBold14.copyWith(color: const Color(0xff878787)))
        ],
      ),
    ));
  }
}
