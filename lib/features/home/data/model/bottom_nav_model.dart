import 'package:flutter/material.dart';

class BottomNavModel {
  final String image, lable;
  final int index;
  final Color? color;

  BottomNavModel(
      {required this.image, this.lable = "", required this.index, this.color});
}
