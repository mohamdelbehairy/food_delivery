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
        height: buttonModel.height ?? 52,
        width: buttonModel.width ?? double.infinity,
        padding: buttonModel.padding,
        margin: buttonModel.margin,
        decoration: BoxDecoration(
            color: buttonModel.backgroundColor,
            border: Border.all(
                color: buttonModel.borderColor ?? Colors.transparent),
            borderRadius:
                BorderRadius.circular(buttonModel.borderRadius ?? 100)),
        child: buttonModel.child ??
            Center(
                child: buttonModel.isLoading
                    ? const LoadingAnimationIndicator()
                    : Text(buttonModel.buttonName,
                        style: buttonModel.style ?? Styles.semiBold14)),
      ),
    );
  }
}
