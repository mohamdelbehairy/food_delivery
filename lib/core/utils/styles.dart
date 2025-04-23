import 'package:flutter/material.dart';

abstract class Styles {
  // reqular
  static const reqular14 = TextStyle(
      fontSize: 14,
      fontFamily: "inter",
      color: Colors.white,
      fontWeight: FontWeight.normal);

  // medium
  static const medium14 = TextStyle(
      fontSize: 14,
      fontFamily: "inter",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  // semiBold
  static const semiBold28 = TextStyle(
      fontSize: 28,
      fontFamily: "inter",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const semiBold14 = TextStyle(
      fontSize: 14,
      fontFamily: "inter",
      color: Colors.white,
      fontWeight: FontWeight.w600);

        static const semiBold12 = TextStyle(
      fontSize: 12,
      fontFamily: "inter",
      color: Colors.white,
      fontWeight: FontWeight.w600);
}
