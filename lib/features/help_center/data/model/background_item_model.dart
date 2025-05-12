import 'package:flutter/material.dart';

class BackgroundItemModel {
  final Widget child;
  final double? height;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin, padding;
  BackgroundItemModel(
      {required this.child,
      this.onTap,
      this.height,
      this.margin,
      this.padding});
}
