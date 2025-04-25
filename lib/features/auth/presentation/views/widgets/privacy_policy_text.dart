import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("I Agree with ", style: Styles.medium14),
            Text("Terms of Service ",
                style:
                    Styles.semiBold14.copyWith(color: AppColors.primaryColor)),
            Text("and ", style: Styles.medium14),
            Text("Privacy",
                style:
                    Styles.semiBold14.copyWith(color: AppColors.primaryColor)),
          ],
        ),
        Text("Policy",
            style: Styles.semiBold14.copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}