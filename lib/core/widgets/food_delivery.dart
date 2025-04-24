import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/auth/auth_bloc.dart';
import '../../features/boarding/presentation/views/boarding_view.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BoardingView(),
      ),
    );
  }
}
