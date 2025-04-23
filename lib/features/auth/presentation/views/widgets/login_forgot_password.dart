import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text("Forgot password?",
            style: Styles.medium12.copyWith(color: AppColors.primaryColor)),
      ),
    );
  }
}