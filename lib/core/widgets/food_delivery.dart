import 'package:flutter/material.dart';

import '../utils/material_app_home.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: materialAppHome(),
    );
  }
}
