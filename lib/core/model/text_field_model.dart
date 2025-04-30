import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText;
  final String? header;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool readOnly;

  TextFieldModel(
      {required this.hintText,
      this.header,
      this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType,
      this.validator,
      this.readOnly = false});
}
