import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../manager/auth/auth_bloc.dart';
import '../../../../../core/widgets/custom_text_field_section.dart';

class ForgotPasswordTextField extends StatelessWidget {
  const ForgotPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return CustomTextFieldSection(
        textFieldModel: TextFieldModel(
            header: "Email Address",
            hintText: "example@gmail.com",
            keyboardType: TextInputType.emailAddress,
            controller: auth.forgotPasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              }
              if (value.isNotEmpty && !EmailValidator.validate(value)) {
                return "Please enter a valid email";
              }
              return null;
            }));
  }
}
