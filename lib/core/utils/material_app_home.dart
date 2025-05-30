import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/boarding/presentation/views/boarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import 'services/shared_pref_service.dart';

Widget materialAppHome() {
  final pref = Helper.getIt.get<SharedPrefService>();
  final isFirstTime = pref.getString(Constants.isFirstTime);
  final userID = pref.getString(Constants.userID);

  if (isFirstTime != null && isFirstTime.isNotEmpty) {
    if (userID != null && userID == FirebaseAuth.instance.currentUser?.uid) {
      return const HomeView();
    }
    return const LoginView();
  }
  return const BoardingView();
}
