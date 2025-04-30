import 'package:flutter/material.dart';

class SvgModel {
  final String image;
  final double? height, width;
  final Color? color;
  final Function()? onTap;

  SvgModel(
      {required this.image, this.height, this.width, this.color, this.onTap});
}
