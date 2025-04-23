import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../manager/boarding/boarding_cubit.dart';

class BoardingSmoothIndicator extends StatelessWidget {
  const BoardingSmoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<BoardingCubit>().controller;
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const ExpandingDotsEffect(
          dotWidth: 7,
          dotHeight: 7,
          dotColor: Color(0xffC2C2C2),
          activeDotColor: Colors.white),
    );
  }
}
