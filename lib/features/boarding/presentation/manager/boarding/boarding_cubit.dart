import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());

  late PageController controller;
  int index = 0;

  void initPageController() {
    controller = PageController();
  }

  void initIndex(int page) {
    index = page;
    emit(InitIndex());
  }
}
