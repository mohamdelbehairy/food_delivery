import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/styles.dart';

class AuthHeaderSection extends StatelessWidget {
  const AuthHeaderSection(
      {super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text(text1,
            style: Styles.semiBold28.copyWith(color: Color(0xff101010))),
        const SizedBox(height: 8),
        Text(text2, style: Styles.medium12.copyWith(color: Color(0xff878787))),
      ],
    );
  }
}
