import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/have_or_not_account_model.dart';

class AuthNotOrHaveAccountWidget extends StatelessWidget {
  const AuthNotOrHaveAccountWidget(
      {super.key, required this.haveOrNotAccountModel});
  final HaveOrNotAccountModel haveOrNotAccountModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(haveOrNotAccountModel.text, style: Styles.medium12),
        GestureDetector(
          onTap: haveOrNotAccountModel.onTap,
          child: Text(haveOrNotAccountModel.buttonName,
              style: Styles.semiBold14.copyWith(color: AppColors.primaryColor)),
        )
      ],
    );
  }
}
