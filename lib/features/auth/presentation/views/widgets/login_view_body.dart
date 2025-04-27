import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_state.dart';
import 'auth_custom_scroll_view.dart';
import 'auth_provider_section.dart';
import 'login_button.dart';
import 'login_forgot_password.dart';
import 'login_header.dart';
import 'login_not_have_account.dart';
import 'login_text_field_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Helper.loginBlocConsumer(context, errorMessage: state.errorMessage);
        }
        if (state is LoginSuccess) {
          auth.loginDispose(context,isLogin: true);
        }
      },
      builder: (context, state) {
        return AuthCustomScrollView(
          formKey: auth.loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              const SizedBox(height: 32),
              LoginTextFieldSection(),
              const SizedBox(height: 20),
              const LoginForgetPassword(),
              const SizedBox(height: 64),
              LoginButton(),
              const SizedBox(height: 24),
              const AuthProviderSection(),
              const SizedBox(height: 32),
              const LoginNotHaveAccount(),
            ],
          ),
        );
      },
    );
  }
}
