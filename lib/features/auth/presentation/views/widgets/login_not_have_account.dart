import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../data/model/have_or_not_account_model.dart';
import '../register_view.dart';
import 'auth_not_or_have_account_widgt.dart';

class LoginNotHaveAccount extends StatelessWidget {
  const LoginNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthNotOrHaveAccountWidget(
      haveOrNotAccountModel: HaveOrNotAccountModel(
          text: "Don't have an account? ",
          buttonName: "Register",
          onTap: () => Navigation.push(context, const RegisterView())),
    );
  }
}
