import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/gender_item_model.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());

  List<GenderItemModel> genderList = [
    GenderItemModel(icon: Icons.male, title: "Male"),
    GenderItemModel(icon: Icons.female, title: "Female"),
  ];

  int currentIndex = -1;

  void changeIndex(int index) {
    if (index == currentIndex) return;
    currentIndex = index;
    emit(GenderChanged());
  }
}
