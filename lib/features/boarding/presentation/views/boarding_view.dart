import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/boarding/boarding_cubit.dart';
import 'widgets/boarding_view_body.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardingCubit()..initPageController(),
      child: const Scaffold(
        body: BoardingViewBody(),
      ),
    );
  }
}
