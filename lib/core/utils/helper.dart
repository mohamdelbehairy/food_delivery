import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/model/svg_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/custom_svg.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/user_data/data/repo/user_data_repo_impl.dart';

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

  static Future<Object?> showAlertWidget(BuildContext context) {
    showGeneralDialog(
        context: context,
        pageBuilder: (_, __, ___) => Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  height: 480,
                  width: MediaQuery.sizeOf(context).width - 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 32),
                      CustomSvg(
                          svgModel: SvgModel(image: Assets.imagesLoginSuccess)),
                      const SizedBox(height: 24),
                      Text('Sign In\n Successful',
                          textAlign: TextAlign.center,
                          style: Styles.styleBoldUrbainst24),
                      const SizedBox(height: 16),
                      Text(
                          'Please wait...\n You will be directed to the homepage soon.',
                          textAlign: TextAlign.center,
                          style: Styles.styleMediumUrbainst16),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: const Color(0xffF4F4F4),
                            strokeWidth: 5),
                      )
                    ],
                  ),
                ),
              ),
            ));
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigation.go(context, const HomeView());
    });
    return Future.value();
  }

  static final getIt = GetIt.instance;

  static void setupLocator() {
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
    getIt.registerSingleton<UserDataRepoImpl>(UserDataRepoImpl());
  }
}
