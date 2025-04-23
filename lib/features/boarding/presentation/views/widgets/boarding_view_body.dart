import 'package:flutter/material.dart';

import 'boarding_page_builder.dart';
import 'boarding_stack_widget.dart';

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BoardingPageBuilder(),
        BoardingStackWidget(),
      ],
    );
  }
}
