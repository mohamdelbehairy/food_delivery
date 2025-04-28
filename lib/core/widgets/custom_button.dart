import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:food_delivery/core/widgets/loading_animation_indicator.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonModel});

  final ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: buttonModel.onTap,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonModel.color,
            border: buttonModel.border,
            borderRadius: BorderRadius.circular(100)),
        child: buttonModel.child ??
            Center(
                child: buttonModel.isLoading
                    ? const LoadingAnimationIndicator()
                    : Text(buttonModel.buttonName, style: Styles.semiBold14)),
      ),
    );
  }
}
