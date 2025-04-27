import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/widgets/custom_button.dart';
import 'package:food_delivery/features/auth/data/model/text_field_model.dart';
import 'package:food_delivery/features/auth/presentation/views/widgets/auth_text_field_section.dart';

import 'auth_custom_scroll_view.dart';
import 'forgot_password_header.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCustomScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ForgotPasswordHeader(),
        const SizedBox(height: 32),
        AuthTextFieldSection(
            textFieldModel: TextFieldModel(
                header: "Email Address", hintText: "Enter Email")),
        const Spacer(),
        CustomButton(
            buttonModel: ButtonModel(buttonName: "Continue", onTap: () {})),
        const SizedBox(height: 8),
      ],
    ));
  }
}
