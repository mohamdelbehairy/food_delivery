import 'package:flutter/material.dart';

import 'auth_header_section.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeaderSection(
        text1: "Create your new\n account",
        text2: "Create an account to start looking for the food you like");
  }
}