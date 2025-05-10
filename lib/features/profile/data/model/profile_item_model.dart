import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;
  final String? leading;
  final bool? isSwitch;

  final Widget? trailing;
  final Function()? onTap;

  ProfileItemModel(
      {required this.title,
      this.leading,
      this.trailing,
      this.onTap,
      this.isSwitch});
}
