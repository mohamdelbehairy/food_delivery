import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/widgets/custom_button.dart';

class GenderBottomSheetButton extends StatelessWidget {
  const GenderBottomSheetButton({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonModel: ButtonModel(
            buttonName: "Select",
            color: AppColors.primaryColor,
            onTap: onTap));
  }
}
