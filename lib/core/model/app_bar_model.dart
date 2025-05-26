import 'package:flutter/material.dart';

class AppBarModel {
  final String title;
  final Color? backgroundColor;
  final BuildContext? context;
  final bool isLeading, isProduct;

  AppBarModel(
      {required this.title,
      this.backgroundColor,
      this.context,
      this.isLeading = true,
      this.isProduct = false});
}
