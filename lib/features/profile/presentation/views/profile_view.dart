import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/profile_repo_impl.dart';
import '../manager/profile/profile_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepoImpl())..getUserData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(),
        body: ProfileViewBody(),
      ),
    );
  }
}
