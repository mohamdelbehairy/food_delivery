import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth/auth_bloc.dart';
import 'auth_custom_scroll_view.dart';
import 'auth_privacy_policy_section.dart';
import 'auth_provider_section.dart';
import 'register_button.dart';
import 'register_have_account.dart';
import 'register_header.dart';
import 'register_text_field_secton.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return AuthCustomScrollView(
      formKey: auth.registerKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegisterHeader(),
          const SizedBox(height: 32),
          const RegisterTextFieldSection(),
          const SizedBox(height: 20),
          const AuthPrivacyPolicySection(),
          const SizedBox(height: 32),
          const RegisterButton(),
          const SizedBox(height: 24),
          const AuthProviderSection(),
          const SizedBox(height: 32),
          const RegisterHaveAccount()
        ],
      ),
    );
  }
}
