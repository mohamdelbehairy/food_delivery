import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../data/model/text_field_model.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.medium12,
      cursorColor: const Color(0xff101010),
      controller: textFieldModel.controller,
      decoration: InputDecoration(
          suffixIcon: textFieldModel.suffixIcon,
          border: Helper.buildBorder(),
          focusedBorder: Helper.buildBorder(),
          enabledBorder: Helper.buildBorder(),
          hintText: textFieldModel.hintText,
          hintStyle: Styles.medium12.copyWith(color: Color(0xff878787))),
    );
  }
}
