import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';

abstract class Styles {
  // reqular
  static const reqular14 = TextStyle(
      fontSize: 14,
      fontFamily: "inter",
      color: Colors.white,
      fontWeight: FontWeight.normal);

  // medium
  static const medium12 = TextStyle(
      fontSize: 12,
      fontFamily: "inter",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  static const medium14 = TextStyle(
      fontSize: 14,
      fontFamily: "inter",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  static const medium10 = TextStyle(
      fontSize: 10,
      fontFamily: "inter",
      color: AppColors.primaryColor,
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

  static const semiBold16 = TextStyle(
      fontSize: 16,
      fontFamily: "inter",
      color: Color(0xff101010),
      fontWeight: FontWeight.w600);

  static const semiBold22 = TextStyle(
      fontSize: 22,
      fontFamily: "inter",
      color: Color(0xff101010),
      fontWeight: FontWeight.w600);

  // urbainst font
  static TextStyle styleBoldUrbainst24 = TextStyle(
      fontSize: 24,
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);

  static TextStyle styleMediumUrbainst16 = TextStyle(
      fontFamily: 'Urbanist',
      fontWeight: FontWeight.w500,
      color: const Color(0xff59606E),
      fontSize: 16);
}
