import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/widgets/custom_button.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../manager/auth/auth_event.dart';
import '../../manager/auth/auth_state.dart';
import '../../../../../core/widgets/custom_scroll_view_widget.dart';
import 'forgot_password_header.dart';
import 'forgot_password_text_field.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          Helper.forgotPasswordBlocConsumer(context);
        }
      },
      builder: (context, state) {
        return CustomScrollViewWidget(
            formKey: auth.forgotPasswordKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForgotPasswordHeader(),
                const SizedBox(height: 32),
                const ForgotPasswordTextField(),
                const Spacer(),
                CustomButton(
                    buttonModel: ButtonModel(
                        isLoading: auth.isLoading,
                        buttonName: "Continue",
                        onTap: () => auth.add(ForgotPasswordEvent()))),
                const SizedBox(height: 8),
              ],
            ));
      },
    );
  }
}
