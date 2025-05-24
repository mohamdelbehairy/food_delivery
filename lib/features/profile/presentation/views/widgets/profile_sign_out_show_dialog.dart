import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/alert_dialog_model.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../../core/utils/services/firebase_auth_service.dart';
import '../../../../../core/utils/services/shared_pref_service.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../auth/presentation/manager/auth/auth_bloc.dart';
import '../../../../auth/presentation/manager/auth/auth_event.dart';
import '../../../../auth/presentation/manager/auth/auth_state.dart';
import '../../../../user_data/data/repo/user_data_repo_impl.dart';

class ProfileSignOutShowDialog extends StatelessWidget {
  const ProfileSignOutShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
          Helper.getIt.get<FirebaseAuthService>(),
          Helper.getIt.get<UserDataRepoImpl>(),
          Helper.getIt.get<SharedPrefService>()),
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              Helper.showAlertWidget(context, isLogOut: true);
            }
          },
          child: Builder(
              builder: (context) => CustomAlertDialog(
                      alertDialogModel: AlertDialogModel(
                    onTap: () => context.read<AuthBloc>().add(LogoutEvent()),
                  )))),
    );
  }
}
