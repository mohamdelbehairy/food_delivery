import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/firebase_options.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../widgets/food_delivery.dart';
import 'bloc_observer.dart';
import 'services/shared_pref_service.dart';

Future<void> initMaint() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserv();
  Helper.setSystem();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefService.init();
  Helper.setupLocator();

  runApp(const FoodDelivery());
}
