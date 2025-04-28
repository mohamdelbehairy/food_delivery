import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/button_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_event.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return CustomButton(
        buttonModel: ButtonModel(
            buttonName: "Register",
            isLoading: auth.isLoading,
            onTap: () => auth.add(RegisterButtonEvent())));
  }
}
