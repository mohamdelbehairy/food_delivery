import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/data/repo/profile_repo_impl.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../manager/auth/auth_bloc.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepoImpl(), ProfileRepoImpl()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: ForgotPasswordViewBody()),
      ),
    );
  }
}
