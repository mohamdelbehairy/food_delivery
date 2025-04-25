import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/features/boarding/presentation/manager/boarding/boarding_cubit.dart';

import 'boarding_header_widget.dart';
import 'boarding_skip_and_next_widget.dart';
import 'boarding_smooth_indicator.dart';

class BoardingStackWidget extends StatelessWidget {
  const BoardingStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardingCubit, BoardingState>(
      builder: (context, state) {
        return Container(
          height: 400,
          width: 311,
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(48)),
          child: const Column(
            children: [
              BoardingHeaderWidget(),
               SizedBox(height: 20),
               BoardingSmoothIndicator(),
               Spacer(),
              BoardingSkipAndNextWidget(),
            ],
          ),
        );
      },
    );
  }
}
