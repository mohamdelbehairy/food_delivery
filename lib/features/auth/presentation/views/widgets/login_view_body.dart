import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'auth_header_section.dart';
import 'auth_signin_widget.dart';
import 'login_forgot_password.dart';
import 'login_text_field_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeaderSection(
              text1: "Login to your\naccount.",
              text2: "Please sign in to your account"),
          const SizedBox(height: 32),
          const LoginTextFieldSection(),
          const SizedBox(height: 20),
          const LoginForgetPassword(),
          const SizedBox(height: 30),
          const CustomButton(buttonName: "Sign In"),
          const SizedBox(height: 24),
          const AuthSignInWidget(),
        ],
      ),
    );
  }
}


