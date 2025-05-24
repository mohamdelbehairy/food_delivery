import 'package:flutter/material.dart';

class ButtonModel {
  final String buttonName;
  final bool isLoading;
  final void Function()? onTap;
  final Color? backgroundColor, borderColor;
  final Widget? child;
  final double? height, width, borderRadius;
  final EdgeInsetsGeometry? padding, margin;
  final TextStyle? style;

  ButtonModel(
      {this.buttonName = "",
      this.isLoading = false,
      this.onTap,
      this.backgroundColor,
      this.borderColor,
      this.child,
      this.height,
      this.width,
      this.borderRadius,
      this.padding,
      this.margin,
      this.style});
}
