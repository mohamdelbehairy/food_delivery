import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';

import '../../../../auth/presentation/views/login_view.dart';
import '../../manager/boarding/boarding_cubit.dart';

class SkipAndNextItem extends StatelessWidget {
  const SkipAndNextItem({super.key, required this.boarding});

  final BoardingCubit boarding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => Navigation.push(context, const LoginView()),
            child: Text("Skip", style: Styles.semiBold12)),
        GestureDetector(
          onTap: () => boarding.controller.animateToPage(
              duration: Duration(milliseconds: 300),
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
