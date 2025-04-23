import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../auth/presentation/views/login_view.dart';
import '../../manager/boarding/boarding_cubit.dart';
import 'skip_and_next_item.dart';

class BoardingSkipAndNextWidget extends StatelessWidget {
  const BoardingSkipAndNextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final boarding = context.read<BoardingCubit>();
    return boarding.index == 2
        ? GestureDetector(
            onTap: () => Navigation.push(context, const LoginView()),
            child: Image.asset(Assets.imagesProgressbutton, height: 90))
        : SkipAndNextItem(boarding: boarding);
  }
}
