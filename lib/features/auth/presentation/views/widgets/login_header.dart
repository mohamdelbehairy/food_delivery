import 'package:flutter/material.dart';

import 'auth_header_section.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeaderSection(
        text1: "Login to your\naccount.",
        text2: "Please sign in to your account");
  }
}
