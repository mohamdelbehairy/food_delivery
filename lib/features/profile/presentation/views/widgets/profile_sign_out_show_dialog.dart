import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../auth/data/repo/auth_repo_impl.dart';
import '../../../../auth/presentation/manager/auth/auth_bloc.dart';
import '../../../../auth/presentation/manager/auth/auth_state.dart';
import '../../../../user_data/data/repo/user_data_repo_impl.dart';
import 'profile_alert_dialog_buttons.dart';
import 'profile_alert_dialog_title.dart';

class ProfileSignOutShowDialog extends StatelessWidget {
  const ProfileSignOutShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(Helper.getIt.get<AuthRepoImpl>(),
          Helper.getIt.get<UserDataRepoImpl>()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Helper.showAlertWidget(context, isLogOut: true);
          }
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          titlePadding: EdgeInsets.only(top: 16, right: 12, left: 24),
          title: const ProfileAlertDialogTitle(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Do you want to log out?",
                  style: Styles.medium12.copyWith(color: Color(0xff878787))),
              const SizedBox(height: 24),
              const ProfileAlertDialogButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
