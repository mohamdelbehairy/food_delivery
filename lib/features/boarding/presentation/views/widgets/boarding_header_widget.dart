import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../manager/boarding/boarding_cubit.dart';

class BoardingHeaderWidget extends StatelessWidget {
  const BoardingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final boarding = context.watch<BoardingCubit>();
    return Column(
      children: [
        Text(
            boarding.index == 0
                ? "We serve incomparable delicacies"
                : boarding.index == 1
                    ? "Experience \nflavors beyond imagination"
                    : "Indulge in a\n world of exquisite tastes",
            textAlign: TextAlign.center,
            style: Styles.semiBold28),
        const SizedBox(height: 16),
        Text(
            boarding.index == 0
                ? "All the best restaurants with their top menu waiting for you, they can’t wait for your order!"
                : boarding.index == 1
                    ? "Explore a world of flavors tailored\n just for you. One tap, and your next favorite meal is on the way!"
                    : "From street bites to fine dining – discover dishes that hit the spot every single time!",
            textAlign: TextAlign.center,
            style: Styles.regular14),
      ],
    );
  }
}
