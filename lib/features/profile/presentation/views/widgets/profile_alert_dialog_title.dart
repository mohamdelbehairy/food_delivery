import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';

class ProfileAlertDialogTitle extends StatelessWidget {
  const ProfileAlertDialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Text("Sign Out", style: Styles.semiBold22),
        Spacer(),
        GestureDetector(
          onTap: () => Navigation.pop(context),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffEDEDED))),
            child: Icon(Icons.close, size: 20, color: Color(0xff101010)),
          ),
        ),
      ],
    );
  }
}
