import 'package:flutter/material.dart';

import '../../../data/model/text_field_model.dart';
import 'auth_text_field_section.dart';

class LoginTextFieldSection extends StatelessWidget {
  const LoginTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextFieldSection(
            textFieldModel: TextFieldModel(
                header: "Email Address", hintText: "Enter Email")),
        const SizedBox(height: 16),
        AuthTextFieldSection(
          textFieldModel: TextFieldModel(
              header: "Password",
              hintText: "Password",
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off_outlined,
                      color: Color(0xffD6D6D6), size: 20))),
        ),
      ],
    );
  }
}
