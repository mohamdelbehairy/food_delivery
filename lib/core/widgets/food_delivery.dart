import 'package:flutter/material.dart';

import '../../features/boarding/presentation/views/boarding_view.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BoardingView(),
    );
  }
}