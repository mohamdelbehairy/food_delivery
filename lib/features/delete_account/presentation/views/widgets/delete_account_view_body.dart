import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../../../core/widgets/loading_animation_indicator.dart';
import '../../manager/delete_Account/delete_account_cubit.dart';

class DeleteAccountViewBody extends StatelessWidget {
  const DeleteAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final deleteAccount = context.read<DeleteAccountCubit>();
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          Helper.showAlertWidget(context,
              isLogOut: true, title: "Account Deleted \n Successful");
        }
      },
      builder: (context, state) {
        if (deleteAccount.isLoading) {
          return Center(
              child: LoadingAnimationIndicator(
                  size: 32, color: AppColors.primaryColor));
        }
        return const SizedBox();
      },
    );
  }
}
