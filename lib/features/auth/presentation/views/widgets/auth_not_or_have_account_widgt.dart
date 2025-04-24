import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

class AuthNotOrHaveAccountWidget extends StatelessWidget {
  const AuthNotOrHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: Styles.medium12),
        GestureDetector(
          onTap: () {},
          child: Text("Register",
              style: Styles.semiBold14.copyWith(color: AppColors.primaryColor)),
        )
      ],
    );
  }
}
