import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth/auth_bloc.dart';
import '../../../../../core/widgets/custom_text_field_section.dart';

class LoginTextFieldSection extends StatelessWidget {
  const LoginTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthBloc>();
    return Column(
      spacing: 16,
      children: auth
          .loginTextFieldList()
          .map((e) => CustomTextFieldSection(textFieldModel: e))
          .toList(),
    );
  }
}
