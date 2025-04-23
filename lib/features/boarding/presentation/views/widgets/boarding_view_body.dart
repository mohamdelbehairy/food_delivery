import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/features/boarding/presentation/manager/boarding/boarding_cubit.dart';

import 'boarding_stack_widget.dart';

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final boarding = context.read<BoardingCubit>();
    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
                itemCount: 3,
                controller: boarding.controller,
                onPageChanged: (index) {
                  boarding.initIndex(index);
                },
                itemBuilder: (context, index) {
                  return BoardingWidget(index: index);
                }),
            const BoardingStackWidget(),
          ],
        );
      },
    );
  }
}

class BoardingWidget extends StatelessWidget {
  const BoardingWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        index == 0
            ? Assets.imagesBoarding1
            : index == 1
                ? Assets.imagesBoarding2
                : Assets.imagesBoarding3,
        fit: BoxFit.cover,
        height: double.infinity);
  }
}
