import 'package:flutter/material.dart';

class ProfileItemModel {
  final String title;
  final String? leading, subTitle;
  final bool? isSwitch;
  final Widget? trailing;
  final Function()? onTap;
  final void Function(bool)? onChanged;

  ProfileItemModel(
      {required this.title,
      this.leading,
      this.subTitle,
      this.trailing,
      this.onTap,
      this.isSwitch,
      this.onChanged});
}
