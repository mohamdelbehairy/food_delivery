import 'package:flutter/material.dart';

class ButtonModel {
  final String buttonName;
  final bool isLoading;
  final void Function()? onTap;
  final Color? color;
  final BoxBorder? border;
  final Widget? child;
  final double? height, width;

  ButtonModel(
      {this.buttonName = "",
      this.isLoading = false,
      this.onTap,
      this.color,
      this.border,
      this.child,
      this.height,
      this.width});
}
