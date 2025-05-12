import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/utils/colors.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_event.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return CustomButton(
      buttonModel: ButtonModel(
          buttonName: "Sign In",
          isLoading: auth.isLoading,
          backgroundColor: AppColors.primaryColor,
          onTap: () => auth.add(LoginButtonEvent())),
    );
  }
}
