import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:food_delivery/core/widgets/custom_button.dart';
import 'package:food_delivery/features/auth/presentation/manager/auth/auth_event.dart';

import '../../../../auth/presentation/manager/auth/auth_bloc.dart';

class ProfileAlertDialogButtons extends StatelessWidget {
  const ProfileAlertDialogButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return Row(
      children: [
        CustomButton(
            buttonModel: ButtonModel(
                height: 48,
                width: 130,
                onTap: () => Navigation.pop(context),
                child: Center(
                    child: Text("Cancel",
                        style: Styles.semiBold14
                            .copyWith(color: const Color(0xff101010)))),
                border: Border.all(color: const Color(0xffD6D6D6)))),
        const SizedBox(width: 12),
        CustomButton(
            buttonModel: ButtonModel(
          height: 48,
          width: 130,
          buttonName: "Log Out",
          color: AppColors.primaryColor,
          onTap: () => auth.add(LogoutEvent()),
        )),
      ],
    );
  }
}
