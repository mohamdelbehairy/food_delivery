import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/home/home_bloc.dart';
import 'bottom_nav_bar_item.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: home.currentIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: Styles.medium10,
            selectedItemColor: AppColors.primaryColor,
            onTap: (index) => home.add(ChangeBottomNavEvent(index: index)),
            items: home.bottomNavItems
                .asMap()
                .entries
                .map((e) => bottomNavBarItem(
                    e.value, e.value.index == home.currentIndex))
                .toList(),
          ),
        );
      },
    );
  }
}
