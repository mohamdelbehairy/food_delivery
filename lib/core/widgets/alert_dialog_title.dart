import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';

class AlertDialogTitle extends StatelessWidget {
  const AlertDialogTitle({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        Text(title ?? "Sign Out", style: Styles.semiBold22),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigation.pop(context),
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffEDEDED))),
            child: const Icon(Icons.close, size: 20, color: Color(0xff101010)),
          ),
        ),
      ],
    );
  }
}
