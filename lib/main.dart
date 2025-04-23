import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/bloc_observer.dart';

import 'core/widgets/food_delivery.dart';

void main() {
  Bloc.observer = BlocObserv();
  runApp(const FoodDelivery());
}
