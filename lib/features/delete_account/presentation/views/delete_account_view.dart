import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/delete_account_repo_impl.dart';
import '../manager/delete_Account/delete_account_cubit.dart';
import 'widgets/delete_account_view_body.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DeleteAccountCubit(DeleteAccountRepoImpl())..deleteAccount(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DeleteAccountViewBody(),
      ),
    );
  }
}
