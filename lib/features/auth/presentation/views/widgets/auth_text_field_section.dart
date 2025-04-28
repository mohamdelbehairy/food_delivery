import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/text_field_model.dart';
import 'auth_text_field.dart';

class AuthTextFieldSection extends StatelessWidget {
  const AuthTextFieldSection({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFieldModel.header!, style: Styles.medium12),
        const SizedBox(height: 8),
        AuthTextField(textFieldModel: textFieldModel),
      ],
    );
  }
}
