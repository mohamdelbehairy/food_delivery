import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../manager/boarding/boarding_cubit.dart';

class BoardingSkipAndNextWidget extends StatelessWidget {
  const BoardingSkipAndNextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final boarding = context.watch<BoardingCubit>();
    return boarding.index == 2
        ? Image.asset(Assets.imagesProgressbutton, height: 90)
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {}, child: Text("Skip", style: Styles.semiBold12)),
              GestureDetector(
                onTap: () => boarding.controller.animateToPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    boarding.controller.page!.toInt() + 1),
                child: Row(
                  children: [
                    Text("Next", style: Styles.semiBold12),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18, color: Colors.white)
                  ],
                ),
              ),
            ],
          );
  }
}
