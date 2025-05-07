import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home/home_bloc.dart';
import 'widgets/bottom_nav_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffF9F9F9),
          body: home.views[home.currentIndex],
          bottomNavigationBar: BottomNavBarWidget(),
        );
      },
    );
  }
}
