import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/boarding/boarding_cubit.dart';
import 'boarding_item.dart';

class BoardingPageBuilder extends StatelessWidget {
  const BoardingPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final boarding = context.read<BoardingCubit>();
    return PageView.builder(
        itemCount: 3,
        controller: boarding.controller,
        onPageChanged: (index) {
          boarding.initIndex(index);
        },
        itemBuilder: (context, index) => BoardingItem(index: index));
  }
}
