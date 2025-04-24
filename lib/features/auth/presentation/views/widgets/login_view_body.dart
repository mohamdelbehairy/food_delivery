import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth/auth_bloc.dart';
import 'auth_not_or_have_account_widgt.dart';
import 'auth_provider_section.dart';
import 'login_button.dart';
import 'login_forgot_password.dart';
import 'login_header.dart';
import 'login_text_field_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: auth.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginHeader(),
                  const SizedBox(height: 32),
                  const LoginTextFieldSection(),
                  const SizedBox(height: 20),
                  const LoginForgetPassword(),
                  const SizedBox(height: 64),
                  const LoginButton(),
                  const SizedBox(height: 24),
                  const AuthProviderSection(),
                  const SizedBox(height: 32),
                  const AuthNotOrHaveAccountWidget(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


