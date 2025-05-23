import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../user_data/data/repo/user_data_repo_impl.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../manager/auth/auth_bloc.dart';
import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(Helper.getIt.get<AuthRepoImpl>(),
          Helper.getIt.get<UserDataRepoImpl>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: ForgotPasswordViewBody()),
      ),
    );
  }
}
