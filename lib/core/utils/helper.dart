import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Helper {
  static OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xffD6D6D6)));
  }

  static void setSystem() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static void customSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void registerBlocConsumer(BuildContext context,
      {required String errorMessage}) {
    if (errorMessage == "email-already-in-use" ||
        errorMessage == "account-exists-with-different-credential") {
      Helper.customSnackBar(context,
          message: "The email address is already in use by another account.");
    } else {
      Helper.customSnackBar(context,
          message: "Oops! Something went wrong. Please try again later.");
    }
  }

  static void loginBlocConsumer(BuildContext context,
      {required String errorMessage}) {
    if (errorMessage == "email-already-in-use" ||
        errorMessage == "account-exists-with-different-credential") {
      Helper.customSnackBar(context,
          message: "The email address is already in use by another account.");
    }
    if (errorMessage == "invalid-credential") {
      Helper.customSnackBar(context,
          message: "The email address or password is incorrect.");
    } else {
      Helper.customSnackBar(context,
          message: "Oops! Something went wrong. Please try again later.");
    }
  }

  static void forgotPasswordBlocConsumer(BuildContext context) {
    Helper.customSnackBar(context,
        message: "Check your email to reset your password for Food Delivery.");
  }
}
