import 'package:flutter/material.dart';

class AppBarModel {
  final String title;
  final Color? backgroundColor;
  final bool isLeading;
  final List<Widget>? actions;
  final BuildContext? context;

  AppBarModel(
      {required this.title,
      this.isLeading = true,
      this.backgroundColor,
      this.actions,
      this.context});
}
