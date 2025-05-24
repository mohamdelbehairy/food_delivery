import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/food_delivery.dart';
import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'helper.dart';

Future<void> initMaint() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = BlocObserv();
  Helper.setSystem();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Helper.setupLocator();

  runApp(const FoodDelivery());
}
