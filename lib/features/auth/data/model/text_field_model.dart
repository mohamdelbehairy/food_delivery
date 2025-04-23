import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText;
  final String? header;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  TextFieldModel(
      {required this.hintText, this.header, this.controller, this.suffixIcon});
}
