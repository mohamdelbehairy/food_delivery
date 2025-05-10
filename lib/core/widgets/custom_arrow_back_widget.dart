import 'package:flutter/material.dart';

class CustomArrowBackWidget extends StatelessWidget {
  const CustomArrowBackWidget({super.key, this.right = 0});
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: const Icon(Icons.arrow_forward_ios,
          size: 20, color: Color(0xff101010)),
    );
  }
}
