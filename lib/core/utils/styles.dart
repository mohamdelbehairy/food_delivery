import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';

abstract class Styles {
  // regular
  static const regular14 = TextStyle(
      fontSize: 14,
      fontFamily: "PlusJakartaSans",
      color: Colors.white,
      fontWeight: FontWeight.normal);

  // medium
  static const medium12 = TextStyle(
      fontSize: 12,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  static const medium14 = TextStyle(
      fontSize: 14,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  static const medium10 = TextStyle(
      fontSize: 10,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500);

  static const medium16 = TextStyle(
      fontSize: 16,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w500);

  static const mediumItalic14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff878787));

  // semiBold
  static const semiBold28 = TextStyle(
      fontSize: 28,
      fontFamily: "PlusJakartaSans",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const semiBold14 = TextStyle(
      fontSize: 14,
      fontFamily: "PlusJakartaSans",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const semiBold12 = TextStyle(
      fontSize: 12,
      fontFamily: "PlusJakartaSans",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const semiBold16 = TextStyle(
      fontSize: 16,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w600);

  static const semiBold22 = TextStyle(
      fontSize: 22,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w600);

  static const semiBold32 = TextStyle(
      fontSize: 32,
      fontFamily: "PlusJakartaSans",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const semiBold24 = TextStyle(
      fontSize: 24,
      fontFamily: "PlusJakartaSans",
      color: Color(0xff101010),
      fontWeight: FontWeight.w600);

  // bold
  static const bold16 = TextStyle(
      fontSize: 16,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700);

  static const bold18 = TextStyle(
      fontSize: 18,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700);

  // extra bold
  static const extraBold15 = TextStyle(
      fontSize: 15,
      fontFamily: "PlusJakartaSans",
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w800);

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
