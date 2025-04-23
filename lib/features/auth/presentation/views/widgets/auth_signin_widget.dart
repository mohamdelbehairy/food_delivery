import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import 'auth_divider.dart';

class AuthSignInWidget extends StatelessWidget {
  const AuthSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AuthDivider(),
        Text("Or sign in with",
            style: Styles.medium12.copyWith(color: const Color(0xff878787))),
        const AuthDivider(),
      ],
    );
  }
}