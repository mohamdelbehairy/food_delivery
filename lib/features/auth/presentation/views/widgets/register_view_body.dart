import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_state.dart';
import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import '../login_view.dart';
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Helper.registerBlocConsumer(context,
              errorMessage: state.errorMessage);
        }
        if (state is RegisterSuccess) {
          Navigation.go(context, const LoginView());
        }
        if (state is LoginSuccess) {
          auth.loginDispose(context);
        }
      },
      builder: (context, state) {
        return CustomScrollViewWidget(
          formKey: auth.registerKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterHeader(),
              const SizedBox(height: 32),
              RegisterTextFieldSection(),
              const SizedBox(height: 20),
              AuthPrivacyPolicySection(),
              const SizedBox(height: 32),
              RegisterButton(),
              const SizedBox(height: 24),
              const AuthProviderSection(),
              const SizedBox(height: 32),
              const RegisterHaveAccount()
            ],
          ),
        );
      },
    );
  }
}
