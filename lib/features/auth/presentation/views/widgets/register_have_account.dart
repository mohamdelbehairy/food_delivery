import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../data/model/have_or_not_account_model.dart';
import 'auth_not_or_have_account_widgt.dart';

class RegisterHaveAccount extends StatelessWidget {
  const RegisterHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthNotOrHaveAccountWidget(
      haveOrNotAccountModel: HaveOrNotAccountModel(
          text: "Already have an account? ",
          buttonName: "Login",
          onTap: () => Navigation.pop(context)),
    );
  }
}
