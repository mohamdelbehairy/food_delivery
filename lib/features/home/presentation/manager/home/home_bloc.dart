import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';

import '../../../data/model/bottom_nav_model.dart';
import '../../views/profile_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeBottomNavEvent) {
        if (event.index == currentIndex) return;
        currentIndex = event.index;
        emit(ChangeBottomNavState());
      }
    });
  }
  int currentIndex = 0;

  List<BottomNavModel> bottomNavItems = [
    BottomNavModel(image: Assets.imagesHome, index: 0, lable: "Home"),
    BottomNavModel(image: Assets.imagesCard, index: 1, lable: "Card"),
    BottomNavModel(image: Assets.imagesChat, index: 2, lable: "Chat"),
    BottomNavModel(image: Assets.imagesProfile, index: 3, lable: "Profile"),
  ];

  List<Widget> views =const [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    ProfileView(),
  ];
}
