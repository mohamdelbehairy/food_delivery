import 'package:flutter/material.dart';

class GenderBottomSheetDivider extends StatelessWidget {
  const GenderBottomSheetDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 4,
        width: 66.67,
        decoration: BoxDecoration(
          color: const Color(0xffD6D6D6),
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}
