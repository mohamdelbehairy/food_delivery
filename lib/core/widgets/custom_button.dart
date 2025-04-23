import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonName});
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: Center(child: Text(buttonName, style: Styles.semiBold14)),
      ),
    );
  }
}
