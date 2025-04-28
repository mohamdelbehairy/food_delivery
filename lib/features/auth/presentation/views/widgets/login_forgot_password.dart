import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../forgot_password_view.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigation.push(context, const ForgotPasswordView()),
        child: Text("Forgot password?",
            style: Styles.medium12.copyWith(color: AppColors.primaryColor)),
      ),
    );
  }
}
