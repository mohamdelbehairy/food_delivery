import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/manager/auth/auth_bloc.dart';
import '../utils/material_app_home.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: materialAppHome(),
      ),
    );
  }
}
