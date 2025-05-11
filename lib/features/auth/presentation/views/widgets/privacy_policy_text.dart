import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:food_delivery/features/auth/presentation/manager/auth/auth_event.dart';

import '../../manager/auth/auth_bloc.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("I Agree with ", style: Styles.medium14),
            GestureDetector(
                onTap: () => auth.add(TermsAndConditionsEvent()),
                child: Text("Terms of Service ",
                    style: Styles.semiBold14
                        .copyWith(color: AppColors.primaryColor))),
            Text("and ", style: Styles.medium14),
            GestureDetector(
                onTap: () => auth.add(PrivacyPolicyEvent()),
                child: Text("Privacy",
                    style: Styles.semiBold14
                        .copyWith(color: AppColors.primaryColor))),
          ],
        ),
        GestureDetector(
            onTap: () => auth.add(PrivacyPolicyEvent()),
            child: Text("Policy",
                style:
                    Styles.semiBold14.copyWith(color: AppColors.primaryColor))),
      ],
    );
  }
}
