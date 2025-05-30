import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../model/text_field_model.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.medium12,
      obscuringCharacter: "*",
      cursorColor: const Color(0xff101010),
      readOnly: textFieldModel.readOnly,
      validator: textFieldModel.validator,
      controller: textFieldModel.controller,
      obscureText: textFieldModel.obscureText,
      keyboardType: textFieldModel.keyboardType,
      decoration: InputDecoration(
          suffixIcon: textFieldModel.suffixIcon,
          border: Helper.buildBorder(),
          focusedBorder: Helper.buildBorder(),
          enabledBorder: Helper.buildBorder(),
          hintText: textFieldModel.hintText,
          hintStyle: Styles.mediumItalic14),
    );
  }
}
