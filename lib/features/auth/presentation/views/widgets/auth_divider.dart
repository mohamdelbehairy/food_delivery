import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .5,
        width: MediaQuery.sizeOf(context).width / 3.5,
        color: Color(0xff878787));
  }
}