import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../features/home/presentation/manager/home/home_bloc.dart';
import '../../features/user_data/data/repo/user_data_repo_impl.dart';
import '../utils/material_app_home.dart';

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(Helper.getIt.get<UserDataRepoImpl>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: materialAppHome(),
      ),
    );
  }
}
