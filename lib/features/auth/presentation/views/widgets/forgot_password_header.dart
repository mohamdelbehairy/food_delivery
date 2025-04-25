import 'package:flutter/material.dart';

import 'auth_header_section.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeaderSection(
        text1: "Forgot password?",
        text2:
            "Enter your email address and we’ll send you confirmation\ncode to reset your password");
  }
}
