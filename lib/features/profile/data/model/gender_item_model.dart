import 'package:flutter/material.dart';

class GenderItemModel {
  final IconData? icon;
  final String title;

  final Function()? onTap;

  GenderItemModel({required this.icon, required this.title, this.onTap});
}
